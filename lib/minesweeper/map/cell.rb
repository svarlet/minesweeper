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
		end
	end
end