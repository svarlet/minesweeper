require 'minesweeper/explosives/explosion_error'

module Minesweeper
  module Explosives
    class Mine
      def trigger
        raise ExplosionError, 'You triggered a mine! Game over.'
      end
    end
  end
end
