require 'test/unit'
require 'minesweeper/map/mine'

module Minesweeper
    module Map
        class MineTest < Test::Unit::TestCase
            def test_trigger_should_raise_error
                assert_raise(RuntimeError) { Mine.new.trigger }
            end
        end
    end
end
