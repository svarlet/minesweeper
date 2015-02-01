require 'test/unit'
require 'minesweeper/map/blank_cell'

module Minesweeper
  module Map
    class BlankCellTest < Test::Unit::TestCase
      def test_to_s_returns_B
        assert_equal('B', BlankCell.new.to_s)
      end
    end
  end
end
