#! /usr/bin/env ruby
require 'optparse'

##
# A premise used in truth tables
class Premise
  attr_accessor :symbol, :position
  @position
  def initialize(proposition_symbol)
    @symbol = proposition_symbol  
  end

  def calc_interval
    2**(@position - 1)
  end

  def truth?(iteration)
    if iteration < calc_interval
      return true
    else
      multiple = iteration / calc_interval
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
  
  def calc_iterations
    2 * (2**(@premises.length-1))
  end

  def generate_underline
    @premises.length.times { print '------' }
    puts "-\n" 
  end

  def generate_headers
    @premises.each do |premise|
      print "|  #{premise.symbol}  " 
    end
    puts '|'
    generate_underline
  end
  
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
  
  def draw
    generate_headers 
    generate_rows
  end
end

tt = TruthTable.new("p", "q", "r")
tt.draw
