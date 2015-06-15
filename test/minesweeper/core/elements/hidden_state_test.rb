require_relative '../../../test_helper.rb'
require 'minesweeper/core/elements/cell'
require_relative '../explosives/mine_spy'

module Minesweeper
  module Core
    module Elements
      class HiddenStateTest < Test::Unit::TestCase
        def setup
          @state = CellState::HIDDEN_STATE
          @mine_spy = Minesweeper::Core::Explosives::MineSpy.new
          @cell = Cell.new(@mine_spy)
        end

        def test_unflag_should_raise_NoMethodError
          assert_raise(NoMethodError) { @state.unflag(@cell) }
        end

        def test_flag_should_change_state_of_cell_to_flagged
          @state.flag(@cell)
          assert_equal(CellState::FLAGGED_STATE, @cell.current_state)
        end

        def test_reveal_should_change_state_of_cell_to_revealed
          @state.reveal(@cell)
          assert_equal(CellState::REVEALED_STATE, @cell.current_state)
        end

        def test_reveal_should_trigger_the_underlying_mine
          @state.reveal(@cell)
          assert(@mine_spy.trigger_called)
        end

        def test_to_s_should_return_H
          assert_equal("H", @state.to_s)
        end
      end
    end
  end
end

