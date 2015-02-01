require 'minesweeper/map/minefield'
require 'minesweeper/map/blank_cell'
require 'minesweeper/map/mine_cell'
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
				assert_equal('B', Minefield.new(1).to_s, "The string representation of a MineField of size 1 is invalid")
				assert_equal('BBBB', Minefield.new(2).to_s, "The string representation of a MineField of size 2 is invalid")
			end

			def test_at_should_raise_a_RangeError_when_position_is_out_of_bounds
				assert_raise(RangeError) { Minefield.new(1).at(2, 2) }
			end

			def test_at_should_return_a_cell_instance
				assert_instance_of(BlankCell, Minefield.new(1).at(0, 0))
			end

			def test_set_mine_at_should_raise_RangeError_when_position_is_out_of_bounds
				assert_raise(RangeError) { Minefield.new(1).set_mine_at(2,2) }
			end

			def test_set_mine_at_changes_the_cell_to_a_mine
				mf = Minefield.new(2)
				mf.set_mine_at(0, 0)
				assert_equal('M', mf.at(0, 0).to_s)
			end
		end
	end
end
