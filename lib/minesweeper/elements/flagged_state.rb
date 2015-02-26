require_relative 'cell_state'

module Minesweeper
  module Elements
    class FlaggedState
      def reveal(cell)
        cell.current_state = CellState::REVEALED_STATE
        cell.trigger
      end

      def unflag(cell)
        cell.current_state = CellState::HIDDEN_STATE
      end

      def to_s
        "F"
      end
    end
  end
end
