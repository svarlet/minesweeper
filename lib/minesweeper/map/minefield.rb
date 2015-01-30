require 'minesweeper/map/cell'

module Minesweeper
	module Map
		class MineField
			def initialize(size)
				raise ArgumentError unless size.is_a?(Fixnum)
				raise ArgumentError unless size >= 0
				@size = size
				@cells = Array.new(size) do
					Array.new(size) { Cell.new(:blank) }
				end
			end

			def to_s
				@cells.flatten.join
			end

			def at(row_index, col_index)
				raise RangeError unless (row_index < @size && col_index < @size)
				@cells[row_index][col_index]
			end
		end
	end
end
