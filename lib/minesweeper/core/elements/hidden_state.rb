module Minesweeper
  module Core
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
end

