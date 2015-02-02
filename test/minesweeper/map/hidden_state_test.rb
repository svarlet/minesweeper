require 'test/unit'
require 'minesweeper/map/hidden_state'

module Minesweeper
    module Map
        class HiddenStateTest < Test::Unit::TestCase
            def test_initialize_expects_a_cell_instance
                assert_raise(ArgumentError) { HiddenState.new(383) }
            end
        end
    end
end
