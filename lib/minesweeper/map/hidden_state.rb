require 'minesweeper/map/cell'

module Minesweeper
    module Map
        class HiddenState
            def initialize(a_cell)
                raise ArgumentError unless a_cell.is_a? Cell
            end

            def reveal

            end

            def flag

            end

            def unflag

            end
        end
    end
end