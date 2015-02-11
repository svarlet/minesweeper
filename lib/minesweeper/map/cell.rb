require 'minesweeper/map/hidden_state'

module Minesweeper
  module Map
    class Cell < CellState
      # STATES
      # ---------------------------------------------------------
      # CURRENT	|	ACTION 	|	STATES			|	ACTION
      # ---------------------------------------------------------
      # hidden	|	reveal	|	revealed 		|
      # hidden	|	reveal	|	revealed 		|	end game
      # hidden	|	flag 	|	flagged			|
      # flagged	|	reveal	|	revealed		|
      # flagged	|	reveal	|	revealed		|
      # flagged	|	unflag	|	hidden			|
      # ---------------------------------------------------------

      attr_accessor :current_state
      attr_reader :mines_around, :hidden_state, :flagged_state, :revealed_state

      def initialize(has_mine = false, mines_around = 0)
        @hidden_state = HiddenState.new(self)
        @flagged_state = FlaggedState.new(self)
        @revealed_state = RevealedState.new(self)

        @current_state = @hidden_state
        @has_mine = has_mine
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

      def has_mine?
        @has_mine
      end

      def to_s
        @current_state.to_s
      end
    end
  end
end