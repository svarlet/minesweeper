require 'test/unit'
require 'minesweeper/map/cell'
require 'minesweeper/map/hidden_state'
require 'minesweeper/map/cell_state_spy'

module Minesweeper
    module Map
        class CellTest < Test::Unit::TestCase
            def setup
                @cell = Cell.new
                @state_spy = CellStateSpy.new
                @cell.current_state = @state_spy
            end

            def test_initialize_should_set_current_state_to_hidden
                assert_instance_of(HiddenState, Cell.new.current_state)
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
        end
    end
end
