module Minesweeper
	module Map
		class Cell
			def initialize(cell_type)
				raise ArgumentError unless [:blank, :mine, :flag].include? cell_type
				@type = cell_type
			end

			def to_s
				case @type
				when :blank
					'B'
				when :mine
					'M'
				when :flag
					'F'
				end
			end
		end
	end
end
