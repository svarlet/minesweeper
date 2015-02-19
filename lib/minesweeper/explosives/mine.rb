module Minesweeper
  module Explosives
    class Mine
      def trigger
        raise 'You triggered a mine! Game over.'
      end
    end
  end
end
