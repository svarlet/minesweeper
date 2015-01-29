
module Minesweeper
	module Map
		class MineField
			def initialize(size)
				raise ArgumentError unless size.is_a?(Fixnum)
				@cells = 'B' * size
			end

			def to_s
				@cells
			end
		end
	end
end
