require 'minesweeper/map/elements/cell_state'

module Minesweeper
    module Map
        module Elements
            class HiddenState < CellState
                def reveal
                    @cell.current_state = @cell.revealed_state
                    @cell.trigger
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
end