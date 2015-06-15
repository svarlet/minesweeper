require_relative '../../../test_helper.rb'
require 'minesweeper/core/elements/cell'
require 'minesweeper/core/elements/hidden_state'
require 'minesweeper/core/explosives/null_mine'
require_relative '../elements/cell_state_spy'
require_relative '../explosives/mine_spy'

module Minesweeper
  module Core
    module Elements
      class CellTest < Test::Unit::TestCase
        def setup
          @cell = Cell.new(Explosives::MineSpy.new)
          @state_spy = CellStateSpy.new
          @cell.current_state = @state_spy
        end

        def test_initialize_should_set_current_state_to_hidden
          assert_equal(CellState::HIDDEN_STATE, Cell.new(Minesweeper::Core::Explosives::MineSpy.new).current_state)
        end

        def test_flag_should_call_the_flag_method_of_the_current_state
          @cell.flag
          assert @state_spy.flag_called
        end

        def test_reveal_should_call_the_reveal_method_of_the_current_state
          @cell.reveal
          assert @state_spy.reveal_called
        end

        def test_unflag_should_call_the_unflag_method_of_the_current_state
          @cell.unflag
          assert @state_spy.unflag_called
        end

        def test_to_s_should_delegate_to_state
          @cell.to_s
          assert @state_spy.to_s_called
        end

        def test_trigger_should_delegate_to_underlying_mine
          a_mine_spy = Explosives::MineSpy.new
          @cell = Cell.new(a_mine_spy)
          @cell.trigger
          assert(a_mine_spy.trigger_called)
        end

        def test_given_a_cell_with_no_mines_when_revealed_then_to_s_returns_mines_around
          safe_cell = Cell.new(Explosives::NullMine.new, 1)
          safe_cell.reveal
          assert_equal('1', safe_cell.to_s)
        end

        def test_when_a_cell_is_revealed_then_revealed_should_be_true
          cell = Cell.new(Explosives::NullMine.new, 0)
          cell.reveal
          assert_true(cell.revealed?)
        end

        def test_flagged_is_false_until_cell_is_flagged
          cell = Cell.new(Explosives::NullMine.new, 0)
          assert_false(cell.flagged?)
        end

        def test_flagged_is_false_after_cell_is_unflagged
          cell = Cell.new(Explosives::NullMine.new, 0)
          cell.flag
          cell.unflag
          assert_false(cell.flagged?)
        end

        def test_flagged_is_true_after_cell_is_flagged
          cell = Cell.new(Explosives::NullMine.new, 0)
          cell.flag
          assert_true(cell.flagged?)
        end
      end
    end
  end
end

