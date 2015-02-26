require_relative 'cell_state'

module Minesweeper
  module Elements
    class RevealedState < CellState
      def to_s
        "R"
      end
    end
  end
end