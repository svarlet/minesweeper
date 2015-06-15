require_relative '../../../test_helper.rb'
require 'minesweeper/core/explosives/mine'
require 'minesweeper/core/explosives/explosion_error'

module Minesweeper
  module Core
    module Explosives
      class MineTest < Test::Unit::TestCase
        def test_trigger_should_raise_error
          assert_raise(ExplosionError) { Mine.new.trigger }
        end
      end
    end
  end
end

