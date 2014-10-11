#! /usr/bin/env ruby
require_relative 'premise'

module TruthTable
  class Table
    attr_reader :premises
    def initialize(premise_count)
      @premise_symbols = %w[p q r s t u v w x y z] 
      @premises = Array.new
      premise_count.times do |number|
        premise = Premise.new(@premise_symbols[number])
        premise.position = number + 1 # to convert from array(zero based), we add one.
        @premises.push premise 
      end
    end
   
    # To cover all combinations of binary logic
    # the truth table must make 2 * 2^(n-1) iterations
    # through the truth test of each premise.
    # n = number of premises given.
    # => Fixnum: Total length of truth table
    def calc_iterations
      2 * (2**(@premises.length - 1))
    end
  end
end
