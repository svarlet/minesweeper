require 'minesweeper/minefield'
require 'minesweeper/elements/cell'
require 'minesweeper/explosives/explosion_error'
require_relative '../test_helper.rb'

module Minesweeper
  class MineFieldTest < Test::Unit::TestCase
    def test_initialization_expects_a_strictly_positive_integer_parameter
      assert_raise(ArgumentError) { Minefield.new(-1) }
      assert_raise(ArgumentError) { Minefield.new('a') }
      assert_raise(ArgumentError) { Minefield.new(1.4) }
      assert_raise(ArgumentError) { Minefield.new(0) }
    end

    def test_minefield_row_count_is_accessible
      assert_equal(4, Minefield.new(4).row_count)
    end

    def test_string_representation_after_initialization
      assert_equal('H', Minefield.new(1).to_s, "The string representation of a MineField of row_count 1 is invalid")
      assert_equal('HHHH', Minefield.new(2).to_s, "The string representation of a MineField of row_count 2 is invalid")
    end

    def test_hiding_a_mine_at_invalid_position_raises_an_error
      assert_raise(RangeError) { Minefield.new(1).hide_mine_at(1, 1) }
    end

    def test_hiding_a_mine_somewhere_should_make_that_cell_explosive
      minefield = Minefield.new(1)
      minefield.hide_mine_at(0, 0)
      assert_raise(ExplosionError) { minefield.reveal_at(0, 0) }
    end

    def test_hiding_a_mine_somewhere_should_increase_the_mine_counters_of_cells_around
      minefield = Minefield.new(2)
      minefield.hide_mine_at(1, 1)
      assert_equal(1, minefield.mines_around(0, 0))
      assert_equal(1, minefield.mines_around(0, 1))
      assert_equal(1, minefield.mines_around(1, 0))
    end

    def test_hiding_a_mine_somewhere_should_not_increase_the_mine_counters_of_non_adjacent_cells
      minefield = Minefield.new(3)
      minefield.hide_mine_at(2,2)
      assert_equal(0, minefield.mines_around(0, 0))
      assert_equal(0, minefield.mines_around(0, 1))
      assert_equal(0, minefield.mines_around(0, 2))
      assert_equal(0, minefield.mines_around(1, 0))
      assert_equal(0, minefield.mines_around(2, 0))
    end

    def test_given_a_non_explosive_cell_with_no_mines_around_when_revealed_then_adjacent_cells_are_revealed
      minefield = Minefield.new(6)
      minefield.hide_mine_at(0, 0)
      minefield.hide_mine_at(1, 2)
      minefield.hide_mine_at(1, 3)
      minefield.hide_mine_at(1, 4)
      minefield.hide_mine_at(3, 1)
      minefield.reveal_at(4, 4)
      expected = 'HHHHHH'
      expected << 'HHHHHH'
      expected << 'HH3321'
      expected << 'HH1000'
      expected << '111000'
      expected << '000000'
      assert_equal(expected, minefield.to_s)
    end

    def test_revealing_a_cell_at_invalid_position_raises_error
      assert_raise(RangeError) { Minefield.new(1).reveal_at(1, 1) }
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
