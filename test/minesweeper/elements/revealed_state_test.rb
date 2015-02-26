require 'test/unit'
require 'minesweeper/elements/cell'
require 'minesweeper/elements/cell_state_error'
require 'minesweeper/elements/hidden_state'
require 'minesweeper/elements/revealed_state'
require 'minesweeper/explosives/mine_spy'

module Minesweeper
  module Elements
    class RevealedStateTest < Test::Unit::TestCase
      def setup
        @cell = Cell.new(Minesweeper::Explosives::MineSpy.new)
        @cell.reveal
      end

      def test_flag_should_raise_cell_state_error
        assert_raise(CellStateError) { @cell.flag }
      end

      def test_reveal_should_raise_cell_state_error
        assert_raise(CellStateError) { @cell.reveal }
      end

      def test_unflag_should_raise_cell_state_error
        assert_raise(CellStateError) { @cell.unflag }
      end

      def test_to_s_should_return_R
        assert_equal("R", @cell.to_s)
      end
    end
  end
end
