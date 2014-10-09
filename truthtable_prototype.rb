#! /usr/bin/env ruby
require 'optparse'

##
# A premise used in truth tables
class Premise
  attr_accessor :symbol, :position
  @position = 1
  def initialize(premise_symbol)
    @symbol = premise_symbol  
  end
  
  ##
  # To insure every combination of premises are compared
  # we use the position of each premise to calculate
  # a truth interval for said premise. This interval is
  # calculated using the formula 2^(p-1); Where p is the
  # position in the truth table.
  # => Fixnum: premise truth interval length
  def calc_interval
    2**(@position - 1)
  end
  
  ##
  # Given an iteration count, uses the truth interval to calculate
  # the premises truth state.
  # => Boolean: Current premise iteration?
  def truth?(iteration)
    if iteration < calc_interval # The first interval is always true
      return true
    else
      multiple = iteration / calc_interval # Calculate interval multiple to decide true or false
      return false if multiple.odd?
      true
    end
  end
end

##
# Given a set of premises, creates a truth table
class TruthTable
  attr_reader  :premises

  def initialize(p, q, r)
    @premises = Array.new
    premise_p = Premise.new(p)
    premise_p.position = 1
    premise_q = Premise.new(q)
    premise_q.position = 2
    premise_r = Premise.new(r)
    premise_r.position = 3
    @premises.push premise_p
    @premises.push premise_q
    @premises.push premise_r
  end
  
  ##
  # To cover all combinations of binary logic
  # the truth table must make 2 * 2^(n-1) iterations
  # through the truth test of each premise.
  # n = number of premises given.
  # => Fixnum: Total length of truth table
  def calc_iterations
    2 * (2**(@premises.length-1))
  end

  ##
  # Generates the underline for each table row
  # => String: row underline
  def generate_underline
    @premises.length.times { print '------' }
    puts "-\n" 
  end

  ##
  # Generates the headings row for truth table
  # => String: Truth Table headings
  def generate_headers
    @premises.each do |premise|
      print "|  #{premise.symbol}  " 
    end
    puts '|'
    generate_underline
  end
 
  ##
  # calculates and generates truth of premises
  # => String: Truth Table premise states
  def generate_rows
    calc_iterations.times do |iteration|
      @premises.each do |premise|
        if premise.truth?(iteration)
          print '|  1  '
        else 
          print '|  0  '
        end
      end
      puts '|'
      generate_underline
    end
  end
 
  ##
  # Initiates generation of truth table
  def draw
    generate_headers 
    generate_rows
  end
end

tt = TruthTable.new("p", "q", "r")
tt.draw
