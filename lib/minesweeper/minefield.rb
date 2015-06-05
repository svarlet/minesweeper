require_relative 'elements/cell'
require_relative 'explosives/null_mine'
require_relative 'explosives/explosion_error'
require_relative 'explosives/mine'

module Minesweeper
  class Minefield
    attr_reader :row_count

    OFFSETS = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [0, -1], [1, 1], [1, 0], [1, -1]]

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
      verify_coordinates_existance(row_index, col_index)
      create_explosive_cell_at(row_index, col_index)
      register_mine_at(row_index, col_index)
      increase_mine_counters_around(row_index, col_index)
    end

    def verify_coordinates_existance(row_index, col_index)
      raise RangeError unless cell_exists_at?(row_index, col_index)
    end

    def create_explosive_cell_at(row_index, col_index)
      mines_around = mines_adjacent_to(row_index, col_index)
      @cells[row_index][col_index] = Elements::Cell.new(Explosives::Mine.new, mines_around)
    end

    def mines_adjacent_to(row_index, col_index)
      cells_coords_around(row_index, col_index).count { |coords| @all_mine_coords.include?(coords) }
    end

    def cells_coords_around(row_index, col_index)
      coords_around = OFFSETS.map { |coords| [row_index + coords[0], col_index + coords[1]] }
      valid_coords = coords_around.select { |coords| cell_exists_at?(coords[0], coords[1]) }
    end

    def cell_exists_at?(row_index, col_index)
      (0...@row_count).include?(row_index) && (0...@row_count).include?(col_index)
    end

    def register_mine_at(row_index, col_index)
      @all_mine_coords << [row_index, col_index]
    end

    def increase_mine_counters_around(row_index, col_index)
      cells_around(row_index, col_index).each { |cell| cell.mines_around += 1 }
    end

    def cells_around(row_index, col_index)
      cells_coords_around(row_index, col_index).map { |coords| cell_at(coords[0], coords[1])}
    end

    def cell_at(row_index, col_index)
      @cells[row_index][col_index]
    end

    def reveal_at(row_index, col_index)
      verify_coordinates_existance(row_index, col_index)
      return if cell_at(row_index, col_index).revealed?
      cell_at(row_index, col_index).reveal
      if cell_at(row_index, col_index).mines_around.zero?
        cells_coords_around(row_index, col_index).each do |coords|
          reveal_at(coords[0], coords[1]) unless @cells[coords[0]][coords[1]].revealed?
        end
      end
    end

    def flag_at(row_index, col_index)
      verify_coordinates_existance(row_index, col_index)
      cell_at(row_index, col_index).flag
    end

    def unflag_at(row_index, col_index)
      verify_coordinates_existance(row_index, col_index)
      cell_at(row_index, col_index).unflag
    end

    def mines_around(row_index, col_index)
      cell_at(row_index, col_index).mines_around
    end

    private :create_non_explosive_cell
    private :create_explosive_cell_at
    private :cell_exists_at?
    private :increase_mine_counters_around
    private :mines_adjacent_to
    private :cells_coords_around
    private :register_mine_at
    private :cells_around
    private :cell_at
  end
end
