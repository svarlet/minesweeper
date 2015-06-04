require_relative 'cell_state'

module Minesweeper
  module Elements
    class Cell
      # STATES
      # ---------------------------------------------------------
      # CURRENT	|	ACTION 	|	STATES			|	ACTION
      # ---------------------------------------------------------
      # hidden	|	reveal	|	revealed 		|	trigger
      # hidden	|	flag 	  |	flagged			|
      # flagged	|	reveal	|	revealed		|	trigger
      # flagged	|	unflag	|	hidden			|
      # ---------------------------------------------------------

      attr_accessor :current_state

      def initialize(mine)
        @current_state = CellState::HIDDEN_STATE
        @mine = mine
      end

      def flag
        current_state.flag(self)
      end

      def reveal
        current_state.reveal(self)
      end

      def unflag
        current_state.unflag(self)
      end

      def to_s
        @current_state.to_s
      end

      def trigger
        @mine.trigger
      end
    end
  end
end
