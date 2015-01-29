require 'minesweeper/map/minefield'
require 'test/unit'

module Minesweeper
	module Map
		class MineFieldTest < Test::Unit::TestCase
			def test_initialization_expects_an_integer_parameter
				assert_raise(ArgumentError) { MineField.new('a') }
				assert_raise(ArgumentError) { MineField.new(1.4) }
				assert_nothing_raised { MineField.new(16) }
			end

			def test_to_s_should_return_an_empty_string_when_map_size_is_0
				assert_equal('', MineField.new(0).to_s)
			end

			def test_to_s
				assert_equal('B', MineField.new(1).to_s)
			end
		end
	end
end
