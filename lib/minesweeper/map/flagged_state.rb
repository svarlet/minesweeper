require 'minesweeper/map/cell_state'

module Minesweeper
    module Map
        class FlaggedState < CellState
            def reveal
                @cell.current_state = @cell.revealed_state
            end

            def unflag
                @cell.current_state = @cell.hidden_state
            end
        end
    end
end