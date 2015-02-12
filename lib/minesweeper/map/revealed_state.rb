require 'minesweeper/map/cell_state'

module Minesweeper
  module Map
    class RevealedState < CellState
        def to_s
            "R"
        end
    end
  end
end