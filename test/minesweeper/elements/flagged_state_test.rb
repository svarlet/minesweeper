require_relative '../../test_helper.rb'
require 'minesweeper/elements/cell'
require_relative '../explosives/mine_spy'

module Minesweeper
  module Elements
    class FlaggedStateTest < Test::Unit::TestCase
      def setup
        @mine_spy = Minesweeper::Explosives::MineSpy.new
        @cell = Cell.new(@mine_spy)
        @cell.flag
        @state = CellState::FLAGGED_STATE
      end

      def test_flag_should_raise_NoMethodError
        assert_raise(NoMethodError) { @state.flag(@cell) }
      end

      def test_unflag_should_change_state_of_cell_to_hidden
        @state.unflag(@cell)
        assert_equal(CellState::HIDDEN_STATE, @cell.current_state)
      end

      def test_reveal_should_change_state_of_cell_to_revealed
        @state.reveal(@cell)
        assert_equal(CellState::REVEALED_STATE, @cell.current_state)
      end

      def test_reveal_should_trigger_the_underlying_mine
        @state.reveal(@cell)
        assert(@mine_spy.trigger_called)
      end

      def test_to_s_should_return_F
        assert_equal("F", @state.to_s)
      end
    end
  end
end
