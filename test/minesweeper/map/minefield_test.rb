require 'minesweeper/map/minefield'
require 'minesweeper/map/cell'
require 'test/unit'

module Minesweeper
	module Map
		class MineFieldTest < Test::Unit::TestCase
			def test_initialization_expects_a_positive_integer_parameter
				assert_raise(ArgumentError) { MineField.new(-1) }
				assert_raise(ArgumentError) { MineField.new('a') }
				assert_raise(ArgumentError) { MineField.new(1.4) }
			end

			def test_string_representation_after_initialization
				assert_equal('', MineField.new(0).to_s, "The string representation of a Minefield of size 0 is invalid")
				assert_equal('B', MineField.new(1).to_s, "The string representation of a MineField of size 1 is invalid")
				assert_equal('BBBB', MineField.new(2).to_s, "The string representation of a MineField of size 2 is invalid")
			end

			def test_at_should_throw_a_RangeError_when_position_is_out_of_bounds
				assert_raise(RangeError) { MineField.new(1).at(2, 2) }
			end

			def test_at_should_return_a_cell_instance
				assert_instance_of(Cell, MineField.new(1).at(0, 0))
			end

			def test_set_mine_at_should_throw_RangeError_when_position_is_out_of_bounds
				assert_raise(RangeError) { MineField.new(1).set_mine_at(2,2) }
			end

			def test_set_mine_at_works
				mf = MineField.new(2)
				mf.set_mine_at(0, 0)
				assert_equal('M', mf.at(0, 0).to_s)
			end
		end
	end
end
