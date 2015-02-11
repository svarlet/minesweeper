require 'test/unit'
require 'minesweeper/map/cell'
require 'minesweeper/map/cell_state_error'
require 'minesweeper/map/flagged_state'
require 'minesweeper/map/revealed_state'

module Minesweeper
  module Map
    class HiddenStateTest < Test::Unit::TestCase
      def setup
        @cell = Cell.new
      end

      def test_unflag_should_raise_cell_state_error
        assert_raise(CellStateError) { @cell.unflag }
      end

      def test_flag_should_change_state_of_cell_to_flagged
        @cell.flag
        assert_instance_of(FlaggedState, @cell.current_state)
      end

      def test_reveal_should_change_state_of_cell_to_revealed
        @cell.reveal
        assert_instance_of(RevealedState, @cell.current_state)
      end

      def test_to_s_should_return_H
        assert_equal("H", @cell.to_s)
      end
    end
  end
end
