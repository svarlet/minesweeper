require 'test/unit'
require 'minesweeper/map/elements/cell'
require 'minesweeper/map/elements/cell_state_error'
require 'minesweeper/map/elements/flagged_state'
require 'minesweeper/map/elements/revealed_state'
require 'minesweeper/explosives/mine_spy'

module Minesweeper
  module Map
    module Elements
      class HiddenStateTest < Test::Unit::TestCase
        def setup
          @mine_spy = Minesweeper::Explosives::MineSpy.new
          @cell = Cell.new(@mine_spy)
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

        def test_reveal_should_trigger_the_underlying_mine
          @cell.reveal
          assert(@mine_spy.trigger_called)
        end

        def test_to_s_should_return_H
          assert_equal("H", @cell.to_s)
        end
      end
    end
  end
end
