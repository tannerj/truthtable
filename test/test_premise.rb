require 'minitest/autorun'
require_relative '../lib/truthtable/premise'

class TestPremise < MiniTest::Test
  def setup
    @premise = Premise.new("p") 
    @premise.position = 1
  end

  def test_premise_symbol_is_initialized
    assert_equal "p", @premise.symbol
  end

  def test_premise_position_is_initialized
    assert_equal 1, @premise.position
  end
  
  def test_premise_position_must_be_positive_integer
   assert_raises ArgumentError do
      @premise.position = - 1
    end
   assert_raises ArgumentError do
      @premise.position = 1.4
    end
    @premise.position = 5
    assert_equal @premise.position, 5
  end

  def test_premise_calc_interval
    @premise.position = 1
    assert_equal 1, @premise.calc_interval
    @premise.position = 2
    assert_equal 2, @premise.calc_interval
    @premise.position = 3
    assert_equal 4, @premise.calc_interval 
  end

  def test_premise_truth
    @premise.position = 1
    assert_raises ArgumentError do
      @premise.truth? -1
    end
    assert_raises ArgumentError do
      @premise.truth? 1.5
    end
    assert_equal true, @premise.truth?(0)
    assert_equal false, @premise.truth?(1)
    assert_equal true, @premise.truth?(2)
    assert_equal false, @premise.truth?(3)
  end
end
