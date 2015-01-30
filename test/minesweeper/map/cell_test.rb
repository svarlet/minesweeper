require 'test/unit'
require 'minesweeper/map/cell'

module Minesweeper
	module Map
		class CellTest < Test::Unit::TestCase
			def test_initialization_with_an_unrecognized_type_should_fail
				assert_raise(ArgumentError) { Cell.new :this_is_an_invalid_cell_type }
			end

			def test_initialization_with_a_recognized_type_should_not_fail
				assert_nothing_raised(ArgumentError) { Cell.new :blank }
				assert_nothing_raised(ArgumentError) { Cell.new :mine }
				assert_nothing_raised(ArgumentError) { Cell.new :flag }
			end

			def test_to_s
				assert_equal('B', Cell.new(:blank).to_s, "The string representation of a blank cell is invalid.")
				assert_equal('M', Cell.new(:mine).to_s, "The string representation of a mined cell is invalid.")
				assert_equal('F', Cell.new(:flag).to_s, "The string representation of a flagged cell is invalid.")
			end
		end
	end
end
