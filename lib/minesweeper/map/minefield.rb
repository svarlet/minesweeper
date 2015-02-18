require 'minesweeper/map/null_mine'

module Minesweeper
  module Map
    class Minefield
      def initialize(size)
        raise ArgumentError unless size.is_a?(Fixnum)
        raise ArgumentError unless size >= 0
        @size = size
        @cells = Array.new(size ** 2) { Cell.new(NullMine.new) }
      end

      def to_s
        @cells.flatten.join
      end

      def at(row_index, col_index)
        raise RangeError unless (0...@size).include? row_index
        raise RangeError unless (0...@size).include? col_index
        @cells[row_index * col_index]
      end
    end
  end
end
