require 'test/unit'
require 'minesweeper/map/null_mine'

module Minesweeper
    module Map
        class NullMineTest < Test::Unit::TestCase
            def test_trigger_does_not_raise_exception
                assert_nothing_raised(RuntimeError) { NullMine.new.trigger }
            end
        end
    end
end
