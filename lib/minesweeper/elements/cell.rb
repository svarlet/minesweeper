require_relative 'cell_state'
require_relative 'hidden_state'
require_relative 'flagged_state'
require_relative 'revealed_state'

module Minesweeper
  module Elements
    class Cell < CellState
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
      attr_reader :mines_around, :hidden_state, :flagged_state, :revealed_state

      def initialize(mine, mines_around = 0)
        @hidden_state = HiddenState.new(self)
        @flagged_state = FlaggedState.new(self)
        @revealed_state = RevealedState.new(self)

        @current_state = @hidden_state
        @mine = mine
        @mines_around = mines_around
      end

      def flag
        current_state.flag
      end

      def reveal
        current_state.reveal
      end

      def unflag
        current_state.unflag
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
