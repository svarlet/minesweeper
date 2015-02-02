module Minesweeper
	module Map
		class Cell
			# STATES
			# ---------------------------------------------------------
			# CURRENT	|	ACTION 	|	STATES			|	ACTION
			# ---------------------------------------------------------
			# hidden	|	reveal	|	blank or digit	|
			# hidden	|	reveal	|	explosed		|	end game
			# hidden	|	flag 	|	flagged			|
			# flagged	|	reveal	|	blank or digit	|
			# flagged	|	reveal	|	explosed		|
			# flagged	|	unflag	|	hidden			|
			# ---------------------------------------------------------

			def initialize
				@current_state = Hidden.new(self)
			end			
		end
	end
end