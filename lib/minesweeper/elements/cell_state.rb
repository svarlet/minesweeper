module Minesweeper
  module Elements
    class CellState
      OPERATION_NOT_ALLOWED = "Operation is not implemented or not possible in that state."

      attr_reader :cell

      def initialize(a_cell)
        raise ArgumentError unless a_cell.is_a? Cell
        @cell = a_cell
      end

      def reveal
        fail
      end

      def fail
        raise CellStateError, OPERATION_NOT_ALLOWED
      end

      def flag
        fail
      end

      def unflag
        fail
      end

      def to_s
        fail
      end

      private :fail
    end
  end
end