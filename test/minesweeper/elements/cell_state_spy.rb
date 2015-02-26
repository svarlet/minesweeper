require 'minesweeper/elements/cell_state'

module Minesweeper
  module Elements
    class CellStateSpy
      attr_reader :flag_called, :reveal_called, :unflag_called, :to_s_called

      def initialize
        @flag_called = false
        @reveal_called = false
        @unflag_called = false
        @to_s_called = false
      end

      def flag(cell)
        @flag_called = true
      end

      def reveal(cell)
        @reveal_called = true
      end

      def unflag(cell)
        @unflag_called = true
      end

      def to_s
        @to_s_called = true
      end
    end
  end
end
