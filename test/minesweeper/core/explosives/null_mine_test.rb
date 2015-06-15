require_relative '../../../test_helper.rb'
require 'minesweeper/core/explosives/null_mine'

module Minesweeper
  module Core
    module Explosives
      class NullMineTest < Test::Unit::TestCase
        def test_trigger_does_not_raise_exception
          assert_nothing_raised(RuntimeError) { NullMine.new.trigger }
        end
      end
    end
  end
end

