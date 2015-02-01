require 'test/unit'
require 'minesweeper/map/digit_cell'

class DigitCellTest < Test::Unit::TestCase
  def to_s_returns_the_value_provided_to_the_constructor
    assert_equal('3', DigitCell.new(3).to_s)
  end
end