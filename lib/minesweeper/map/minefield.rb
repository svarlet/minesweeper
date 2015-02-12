require 'minesweeper/map/null_mine'

module Minesweeper
  module Map
    class Minefield
      def initialize(size)
        raise ArgumentError unless size.is_a?(Fixnum)
        raise ArgumentError unless size >= 0
        @size = size
        @cells = create_a_squared_matrix_of_empty_cells(size)
      end

      def create_a_squared_matrix_of_empty_cells(size)
        Array.new(size) do
          Array.new(size) { Cell.new(NullMine.new) }
        end
      end

      def to_s
        @cells.flatten.join
      end

      def at(row_index, col_index)
        raise RangeError unless (row_index < @size && col_index < @size)
        @cells[row_index][col_index]
      end

      private :create_a_squared_matrix_of_empty_cells
    end
  end
end
