module TruthTable
  ##
  # A premise used in truth tables
  class Premise
    attr_accessor :symbol, :position
    def initialize(premise_symbol)
      @symbol = premise_symbol  
      @position = 1
    end
 
    #Positions must be greater than zero
    def position=(position)
      raise ArgumentError, 'Premise::position must be positive.' unless position > 0
      raise ArgumentError, 'Premise::position must be an integer.' unless position.is_a?  Integer
      @position = position
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
      raise ArgumentError, 'Premise::truth? only accepts parameters that are greater than or equal to zero.' unless iteration >= 0
      raise ArgumentError, 'Premise::truth? only accepts integers' unless iteration.is_a? Integer
      if iteration < calc_interval # The first interval is always true
        return true
      else
        multiple = iteration / calc_interval # Calculate interval multiple to decide true or false
        return false if multiple.odd?
        true
      end
    end
  end
end
