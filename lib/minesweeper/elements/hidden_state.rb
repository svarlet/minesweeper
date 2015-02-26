require_relative 'cell_state'

module Minesweeper
  module Elements
    class HiddenState
      def reveal(cell)
        cell.current_state = CellState::REVEALED_STATE
        cell.trigger
      end

      def flag(cell)
        cell.current_state = CellState::FLAGGED_STATE
      end

      def to_s
        "H"
      end
    end
  end
end