require 'minesweeper/map/elements/cell_state'

module Minesweeper
  module Map
    module Elements
        class RevealedState < CellState
            def to_s
                "R"
            end
        end
    end
  end
end