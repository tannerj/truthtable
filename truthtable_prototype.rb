#! /usr/bin/env ruby
require 'optparse'

##
# A premise used in truth tables
class Premise
  attr_accessor :symbol, :position
  @position = 0

  def initialize(premise_symbol)
    @sybmol = premise_symbol
  end

  def add_position(position)
    @position = position
  end

  def truth?(iteration)
   return true 
  end
end

##
# Given a set of premises, creates a truth table
class TruthTable
  attr_reader  :premises

  def initialize(p,q)
    @premises = Array.new 
    premise_p = Premise.new("p")
	premise_p.add_position 1
	premise_q = Premise.new("q")
	premise_q.add_position 2
	@premises.push premise_p
	@premises.push premise_q
  end

  def draw
	puts '|  p  |  q  |' #output heading
	puts '-------------'
	4.times do |iteration|
      @premises.each do |premise|
        premise.truth?(iteration) 
	  end
	end
  end
end

tt = TruthTable.new("p", "q")
tt.draw
