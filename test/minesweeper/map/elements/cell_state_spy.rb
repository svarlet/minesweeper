require 'minesweeper/map/elements/cell_state'

module Minesweeper
  module Map
    module Elements
      class CellStateSpy < CellState
        attr_reader :flag_called, :reveal_called, :unflag_called, :to_s_called

        def initialize
          @flag_called = false
          @reveal_called = false
          @unflag_called = false
          @to_s_called = false
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

        def to_s
          @to_s_called = true
        end
      end
    end
  end
end
