require 'minesweeper/map/minefield'
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
		end
	end
end
