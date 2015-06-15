require_relative 'hidden_state'
require_relative 'revealed_state'
require_relative 'flagged_state'

module Minesweeper
  module Core
    module Elements
      module CellState
        HIDDEN_STATE = HiddenState.new
        FLAGGED_STATE = FlaggedState.new
        REVEALED_STATE = RevealedState.new
      end
    end
  end
end

