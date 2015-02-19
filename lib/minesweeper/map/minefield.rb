require 'minesweeper/map/elements/cell'
require 'minesweeper/explosives/null_mine'
require 'minesweeper/explosives/explosion_error'

module Minesweeper
  module Map
    class Minefield
      def initialize(size)
        raise ArgumentError unless size.is_a?(Fixnum)
        raise ArgumentError unless size > 0
        @size = size
        @cells = Array.new(size ** 2) { create_non_explosive_cell }
      end

      def create_non_explosive_cell
        Elements::Cell.new(Explosives::NullMine.new)
      end

      def to_s
        @cells.flatten.join
      end

      def hide_mine_at(row_index, col_index)
        raise RangeError unless (0...@size).include?(row_index)
        raise RangeError unless (0...@size).include?(col_index)
        @cells[row_index * col_index] = create_explosive_cell
      end

      def create_explosive_cell
        Elements::Cell.new(Explosives::Mine.new)
      end

      def reveal_at(row_index, col_index)
        raise RangeError unless (0...@size).include?(row_index)
        raise RangeError unless (0...@size).include?(col_index)
        @cells[row_index * col_index].reveal
      end

      private :create_non_explosive_cell
      private :create_explosive_cell
    end
  end
end
