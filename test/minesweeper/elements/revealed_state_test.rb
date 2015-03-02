require 'test/unit'
require 'minesweeper/elements/cell'
require_relative '../explosives/mine_spy'

module Minesweeper
  module Elements
    class RevealedStateTest < Test::Unit::TestCase
      def setup
        @cell = Cell.new(Minesweeper::Explosives::MineSpy.new)
        @cell.reveal
        @state = CellState::REVEALED_STATE
      end

      def test_flag_should_raise_NoMethodError
        assert_raise(NoMethodError) { @state.flag(@cell) }
      end

      def test_reveal_should_raise_cell_state_error
        assert_raise(NoMethodError) { @state.reveal(@cell) }
      end

      def test_unflag_should_raise_cell_state_error
        assert_raise(NoMethodError) { @state.unflag(@cell) }
      end

      def test_to_s_should_return_R
        assert_equal("R", @state.to_s)
      end
    end
  end
end
