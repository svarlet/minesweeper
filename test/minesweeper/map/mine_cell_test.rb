require 'test/unit'
require 'minesweeper/map/mine_cell'

class MineCellTest
  def test_to_s_returns_M
    assert_equal('M', MineCell.new.to_s)
  end
end