require_relative 'elements/cell'
require_relative 'explosives/null_mine'
require_relative 'explosives/explosion_error'
require_relative 'explosives/mine'

module Minesweeper
  class Minefield
    attr_reader :row_count

    OFFSETS = [[-1, -1], [-1, 0], [1, -1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]

    def initialize(row_count)
      raise ArgumentError unless row_count.is_a?(Fixnum)
      raise ArgumentError unless row_count > 0
      @row_count = row_count
      @cells = Array.new(row_count) { Array.new(row_count) { create_non_explosive_cell } }
      @all_mine_coords = []
    end

    def create_non_explosive_cell
      Elements::Cell.new(Explosives::NullMine.new)
    end

    def to_s
      @cells.flatten.join
    end

    def hide_mine_at(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
      mines_around = mines_adjacent_to(row_index, col_index)
      @cells[row_index][col_index] = create_explosive_cell(mines_around)
      @all_mine_coords << [row_index, col_index]
      increase_mine_counters_around(row_index, col_index)
    end

    def cell_exists_at?(row_index, col_index)
      (0...@row_count).include?(row_index) && (0...@row_count).include?(col_index)
    end

    def create_explosive_cell(mines_around)
      Elements::Cell.new(Explosives::Mine.new, mines_around)
    end

    def mines_adjacent_to(row_index, col_index)
      OFFSETS.count do |x, y|
        return false unless cell_exists_at?(row_index + x, col_index + y)
        @all_mine_coords.include?([row_index + x, col_index + y])
      end
    end

    def increase_mine_counters_around(row_index, col_index)
      OFFSETS.each do |x, y|
        next unless cell_exists_at?(row_index + x, col_index + y)
        a_cell_around = @cells[row_index + x][col_index + y]
        a_cell_around.mines_around = a_cell_around.mines_around + 1
      end
    end

    def reveal_at(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
      return if @cells[row_index][col_index].revealed?
      @cells[row_index][col_index].reveal
      if @cells[row_index][col_index].mines_around.zero?
        OFFSETS.each do |x, y|
          next unless cell_exists_at?(row_index + x, col_index + y)
          next if @cells[row_index + x][col_index + y].revealed?
          reveal_at(row_index + x, col_index + y)
        end
      end
    end

    def flag_at(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
      @cells[row_index][col_index].flag
    end

    def unflag_at(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
      @cells[row_index][col_index].unflag
    end

    def mines_around(row_index, col_index)
      @cells[row_index][col_index].mines_around
    end

    private :create_non_explosive_cell
    private :create_explosive_cell
    private :cell_exists_at?
    private :increase_mine_counters_around
    private :mines_adjacent_to
  end
end
