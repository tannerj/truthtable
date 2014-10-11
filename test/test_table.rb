require 'minitest/autorun'
require_relative '../lib/truthtable/table'

class TestTable < MiniTest::Test
  def setup
  end

  def test_table_initialize
    @truth_table = TruthTable::Table.new(3)    
    assert_equal 3, @truth_table.premises.length
  end

  def test_calc_iterations
    @truth_table = TruthTable::Table.new(1)
    assert_equal 2, @truth_table.calc_iterations
    @truth_table = TruthTable::Table.new(2)
    assert_equal 4, @truth_table.calc_iterations    
    @truth_table = TruthTable::Table.new(3)
    assert_equal 8, @truth_table.calc_iterations

  end
end
