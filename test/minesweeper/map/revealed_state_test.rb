require 'test/unit'
require 'minesweeper/map/cell'
require 'minesweeper/map/cell_state_error'
require 'minesweeper/map/hidden_state'
require 'minesweeper/map/revealed_state'

module Minesweeper
    module Map
        class RevealedStateTest < Test::Unit::TestCase
            def setup
                @cell = Cell.new
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
        end
    end
end
