require 'minitest/autorun'
require './ruby/day11'

class Day11Test < MiniTest::Test
  def test_basic_state_is_empty
    input = <<~TEST
      LLL
      LLL
      LLL
    TEST
    seating_pattern = SeatingPattern.new(input)
    assert_equal(0, seating_pattern.occupied_seats())
  end

  def test_pattern_fills_after_one_application
    input = <<~TEST
      LLL
      LLL
      LLL
    TEST
    seating_pattern = SeatingPattern.new(input)
    seating_pattern.apply()
    assert_equal(9, seating_pattern.occupied_seats())
  end

  def test_pattern_empties_four_or_more_adjacent_seats
    input = <<~TEST
      \#\#\#
      \#\#\#
      \#\#\#
    TEST
    seating_pattern = SeatingPattern.new(input)
    assert_equal(3, seating_pattern.adjacent_occupied_seats(0,0))
    assert_equal(5, seating_pattern.adjacent_occupied_seats(0,1))
    assert_equal(3, seating_pattern.adjacent_occupied_seats(0,2))
    assert_equal(5, seating_pattern.adjacent_occupied_seats(1,0))
    assert_equal(8, seating_pattern.adjacent_occupied_seats(1,1))
    assert_equal(5, seating_pattern.adjacent_occupied_seats(1,2))
    assert_equal(3, seating_pattern.adjacent_occupied_seats(2,0))
    assert_equal(5, seating_pattern.adjacent_occupied_seats(2,1))
    assert_equal(3, seating_pattern.adjacent_occupied_seats(2,2))
    seating_pattern.apply()
    assert_equal(4, seating_pattern.occupied_seats())
  end

  def test_apply_until_stable_gives_final_number_of_occupied_seats
    input = <<~TEST
      LLL
      LLL
      LLL
    TEST
    seating_pattern = SeatingPattern.new(input)
    assert_equal(4, seating_pattern.apply_until_stable)
  end
  
  def test_example_stabilises
    input = <<~TEST
      L.LL.LL.LL
      LLLLLLL.LL
      L.L.L..L..
      LLLL.LL.LL
      L.LL.LL.LL
      L.LLLLL.LL
      ..L.L.....
      LLLLLLLLLL
      L.LLLLLL.L
      L.LLLLL.LL
    TEST
    seating_pattern = SeatingPattern.new(input)
    assert_equal(37, seating_pattern.apply_until_stable)
  end
end