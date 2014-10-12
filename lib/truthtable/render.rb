module TruthTable
  class Render
    def initialize(table)
      @table = table
      self
    end
    # Generates the underline for each table row
    # => String: row underline
    def generate_underline
      @table.premises.length.times { print '------' }
      puts "-\n" 
    end

    # Generates the headings row for truth table
    # => String: Truth Table headings
    def generate_headers
      @table.premises.each do |premise|
        print "|  #{premise.symbol}  " 
      end
      puts '|'
      generate_underline
    end
 
    # calculates and generates truth of premises
    # => String: Truth Table premise states
    def generate_rows
      @table.calc_iterations.times do |iteration|
        @table.premises.each do |premise|
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
 
    # Initiates generation of truth table
    def render
      generate_headers 
      generate_rows
    end
  end
end
