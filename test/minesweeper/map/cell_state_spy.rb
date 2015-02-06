require 'minesweeper/map/cell_state'

module Minesweeper
    module Map
        class CellStateSpy < CellState
            attr_reader :flag_called, :reveal_called, :unflag_called

            def initialize
                @flag_called = false
                @reveal_called = false
                @unflag_called = false
            end

            def flag
                @flag_called = true
            end

            def reveal
                @reveal_called = true
            end

            def unflag
                @unflag_called = true
            end
        end
    end
end
