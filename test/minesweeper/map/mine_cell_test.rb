require 'test/unit'
require 'minesweeper/map/mine_cell'

module Minesweeper
  module Map
    class MineCellTest
      def test_to_s_returns_M
        assert_equal('M', MineCell.new.to_s)
      end
    end
  end
end
