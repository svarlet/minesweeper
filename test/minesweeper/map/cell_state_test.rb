require 'test/unit'
require 'minesweeper/map/cell'
require 'minesweeper/map/cell_state'
require 'minesweeper/map/cell_state_error'

module Minesweeper
  module Map
    class CellStateTest < Test::Unit::TestCase
      def test_initialize_expects_a_cell_instance
        assert_raise(ArgumentError) { CellState.new(3829) }
        assert_nothing_raised(ArgumentError) { CellState.new(Cell.new) }
      end

      def test_initialization_stores_provided_cell_instance
        a_cell = Cell.new
        a_state = CellState.new(a_cell)
        assert_equal(a_cell, a_state.cell)
      end

      def test_reveal_should_raise_cell_state_error
        assert_raise(CellStateError) { CellState.new(Cell.new).reveal }
      end

      def test_flag_should_raise_cell_state_error
        assert_raise(CellStateError) { CellState.new(Cell.new).flag }
      end

      def test_unflag_should_raise_cell_state_error
        assert_raise(CellStateError) { CellState.new(Cell.new).unflag }
      end

      def test_to_s_should_raise_cell_state_error
        assert_raise(CellStateError) { CellState.new(Cell.new).to_s }
      end
    end
  end
end