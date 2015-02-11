require 'test/unit'
require 'minesweeper/map/cell'
require 'minesweeper/map/cell_state_error'
require 'minesweeper/map/hidden_state'
require 'minesweeper/map/revealed_state'

module Minesweeper
  module Map
    class FlaggedStateTest < Test::Unit::TestCase
      def setup
        @cell = Cell.new
        @cell.flag
      end

      def test_flag_should_raise_cell_state_error
        assert_raise(CellStateError) { @cell.flag }
      end

      def test_unflag_should_change_state_of_cell_to_hidden
        @cell.unflag
        assert_instance_of(HiddenState, @cell.current_state)
      end

      def test_reveal_should_change_state_of_cell_to_revealed
        @cell.reveal
        assert_instance_of(RevealedState, @cell.current_state)
      end

      def test_to_s_should_return_F
        assert_equal("F", @cell.to_s)
      end
    end
  end
end
