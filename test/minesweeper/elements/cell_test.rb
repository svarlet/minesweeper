require 'test/unit'
require 'minesweeper/elements/cell'
require 'minesweeper/elements/hidden_state'
require 'minesweeper/elements/cell_state_spy'
require 'minesweeper/explosives/mine_spy'

module Minesweeper
  module Map
    module Elements
      class CellTest < Test::Unit::TestCase
        def setup
          @cell = Cell.new(Minesweeper::Explosives::MineSpy.new)
          @state_spy = CellStateSpy.new
          @cell.current_state = @state_spy
        end

        def test_initialize_should_set_current_state_to_hidden
          assert_instance_of(HiddenState, Cell.new(Minesweeper::Explosives::MineSpy.new).current_state)
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
          a_mine_spy = Minesweeper::Explosives::MineSpy.new
          @cell = Cell.new(a_mine_spy)
          @cell.trigger
          assert(a_mine_spy.trigger_called)
        end
      end
    end
  end
end
