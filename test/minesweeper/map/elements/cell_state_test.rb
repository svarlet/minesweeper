require 'test/unit'
require 'minesweeper/map/elements/cell'
require 'minesweeper/map/elements/cell_state'
require 'minesweeper/map/elements/cell_state_error'
require 'minesweeper/explosives/mine_spy'

module Minesweeper
  module Map
    module Elements
      class CellStateTest < Test::Unit::TestCase
        def setup
          @cell = Cell.new(Minesweeper::Explosives::MineSpy.new)
        end

        def test_initialize_expects_a_cell_instance
          assert_raise(ArgumentError) { CellState.new(3829) }
          assert_nothing_raised(ArgumentError) { CellState.new(@cell) }
        end

        def test_initialization_stores_provided_cell_instance
          a_state = CellState.new(@cell)
          assert_equal(@cell, a_state.cell)
        end

        def test_reveal_should_raise_cell_state_error
          assert_raise(CellStateError) { CellState.new(@cell).reveal }
        end

        def test_flag_should_raise_cell_state_error
          assert_raise(CellStateError) { CellState.new(@cell).flag }
        end

        def test_unflag_should_raise_cell_state_error
          assert_raise(CellStateError) { CellState.new(@cell).unflag }
        end

        def test_to_s_should_raise_cell_state_error
          assert_raise(CellStateError) { CellState.new(@cell).to_s }
        end
      end
    end
  end
end
