require 'minesweeper/minefield'
require 'minesweeper/elements/cell'
require 'minesweeper/explosives/explosion_error'
require 'test/unit'

module Minesweeper
  class MineFieldTest < Test::Unit::TestCase
    def test_initialization_expects_a_strictly_positive_integer_parameter
      assert_raise(ArgumentError) { Minefield.new(-1) }
      assert_raise(ArgumentError) { Minefield.new('a') }
      assert_raise(ArgumentError) { Minefield.new(1.4) }
      assert_raise(ArgumentError) { Minefield.new(0) }
    end

    def test_string_representation_after_initialization
      assert_equal('H', Minefield.new(1).to_s, "The string representation of a MineField of size 1 is invalid")
      assert_equal('HHHH', Minefield.new(2).to_s, "The string representation of a MineField of size 2 is invalid")
    end

    def test_hiding_a_mine_at_invalid_position_raises_an_error
      assert_raise(RangeError) { Minefield.new(1).hide_mine_at(1, 1) }
    end

    def test_hiding_a_mine_somewhere_should_make_that_cell_explosive
      minefield = Minefield.new(1)
      minefield.hide_mine_at(0, 0)
      assert_raise(ExplosionError) { minefield.reveal_at(0, 0) }
    end

    def test_revealing_a_cell_at_invalid_position_raises_error
      assert_raise(RangeError) { Minefield.new(1).reveal_at(1, 1) }
    end

    def test_revealing_a_cell_should_change_its_state
      minefield = Minefield.new(1)
      minefield.reveal_at(0, 0)
      assert_equal('R', minefield.to_s)
    end

    def test_flagging_a_cell_at_an_invalid_position_raises_error
      assert_raise(RangeError) { Minefield.new(1).flag_at(1, 1) }
    end

    def test_flagging_a_cell_should_change_its_state
      minefield = Minefield.new(1)
      minefield.flag_at(0, 0)
      assert_equal('F', minefield.to_s)
    end

    def test_unflagging_a_cell_at_an_invalid_position_raises_error
      assert_raise(RangeError) { Minefield.new(1).unflag_at(1, 1) }
    end

    def test_unflagging_a_cell_should_change_its_state
      minefield = Minefield.new(1)
      minefield.flag_at(0, 0)
      minefield.unflag_at(0, 0)
      assert_equal('H', minefield.to_s)
    end
  end
end
