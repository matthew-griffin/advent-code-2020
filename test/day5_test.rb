require 'minitest/autorun'
require './ruby/day5'

class Day5Test < MiniTest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_all_front_left_is_zero
    assert_equal(0, calculate_seat_id("FFFFFFFLLL"))
  end

  def test_all_front_last_right_is_one
    assert_equal(1, calculate_seat_id("FFFFFFFLLR"))
  end

  def test_all_front_first_right_is_four
    assert_equal(4, calculate_seat_id("FFFFFFFRLL"))
  end

  def test_all_front_right_left_right_is_five
    assert_equal(5, calculate_seat_id("FFFFFFFRLR"))
  end

  def test_all_front_one_back_is_eight
    assert_equal(8, calculate_seat_id("FFFFFFBLLL"))
  end

 def test_given_examples
   assert_equal(567, calculate_seat_id("BFFFBBFRRR"))
   assert_equal(119, calculate_seat_id("FFFBBBFRRR"))
   assert_equal(820, calculate_seat_id("BBFFBBFRLL"))
 end
end
