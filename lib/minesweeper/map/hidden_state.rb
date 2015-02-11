require 'minesweeper/map/cell_state'

module Minesweeper
    module Map
        class HiddenState < CellState
            def reveal
                @cell.current_state = @cell.revealed_state
            end

            def flag
                @cell.current_state = @cell.flagged_state
            end

            def to_s
              "H"
            end
        end
    end
end