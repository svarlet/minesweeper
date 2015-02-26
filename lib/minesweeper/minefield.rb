require_relative 'elements/cell'
require_relative 'explosives/null_mine'
require_relative 'explosives/explosion_error'
require_relative 'explosives/mine'

module Minesweeper
  class Minefield
    def initialize(size)
      raise ArgumentError unless size.is_a?(Fixnum)
      raise ArgumentError unless size > 0
      @size = size
      @cells = Array.new(size) { Array.new(size) { create_non_explosive_cell } }
    end

    def create_non_explosive_cell
      Elements::Cell.new(Explosives::NullMine.new)
    end

    def to_s
      @cells.flatten.join
    end

    def hide_mine_at(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
      @cells[row_index][col_index] = create_explosive_cell
    end

    def cell_exists_at?(row_index, col_index)
      (0...@size).include?(row_index) && (0...@size).include?(col_index)
    end

    def create_explosive_cell
      Elements::Cell.new(Explosives::Mine.new)
    end

    def reveal_at(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
      @cells[row_index][col_index].reveal
    end

    def flag_at(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
      @cells[row_index][col_index].flag
    end

    def unflag_at(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
      @cells[row_index][col_index].unflag
    end

    private :create_non_explosive_cell
    private :create_explosive_cell
    private :cell_exists_at?
  end
end
