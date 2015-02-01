module Minesweeper
  module Map
    class DigitCell
      def initialize(mines_around)
        @mines_around = mines_around
      end

      def to_s
        return @mines_around.to_s
      end
    end
  end
end
