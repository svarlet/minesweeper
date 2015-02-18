require 'minesweeper/map/minefield'
require 'test/unit'

module Minesweeper
	module Map
		class MineFieldTest < Test::Unit::TestCase
			def test_initialization_expects_a_positive_integer_parameter
				assert_raise(ArgumentError) { Minefield.new(-1) }
				assert_raise(ArgumentError) { Minefield.new('a') }
				assert_raise(ArgumentError) { Minefield.new(1.4) }
			end

			def test_string_representation_after_initialization
				assert_equal('', Minefield.new(0).to_s, "The string representation of a Minefield of size 0 is invalid")
				assert_equal('H', Minefield.new(1).to_s, "The string representation of a MineField of size 1 is invalid")
				assert_equal('HHHH', Minefield.new(2).to_s, "The string representation of a MineField of size 2 is invalid")
			end

			def test_at_should_raise_a_RangeError_when_position_is_out_of_bounds
				assert_raise(RangeError) { Minefield.new(1).at(1, 1) }
				assert_raise(RangeError) { Minefield.new(1).at(-1, -1) }
				assert_raise(RangeError) { Minefield.new(1).at(-1, 0) }
				assert_raise(RangeError) { Minefield.new(1).at(0, -1) }
			end

			def test_at_should_return_a_cell_instance
				assert_instance_of(Cell, Minefield.new(1).at(0, 0))
			end
		end
	end
end
