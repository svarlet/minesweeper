
module Minesweeper
	module Map
		class MineField
			def initialize(size)
				raise ArgumentError unless size.is_a?(Fixnum)
				raise ArgumentError unless size >= 0
				@cells = 'B' * (size ** 2)
			end

			def to_s
				@cells
			end
		end
	end
end
