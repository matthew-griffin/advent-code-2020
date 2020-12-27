require 'minitest/autorun'
require './ruby/day9'

class Day9Test < MiniTest::Test
  def test_invalid_found_in_order
    assert_equal(4, find_first_invalid(2, [1,2,4]))
  end

  def test_invalid_found_out_of_order
    assert_equal(5, find_first_invalid(2, [2,1,5]))
  end

  def test_invalid_found_when_not_first
    assert_equal(4, find_first_invalid(2, [1,2,3,4]))
  end

  def test_invalid_found_in_example
    assert_equal(127, find_first_invalid(5,[
      35,
      20,
      15,
      25,
      47,
      40,
      62,
      55,
      65,
      95,
      102,
      117,
      150,
      182,
      127,
      219,
      299,
      277,
      309,
      576
    ]))
  end

  def test_encryption_weakness_found_in_order
    assert_equal(4, find_encryption_weakness(6, [1,2,3,6]))
  end

  def test_encryption_weakness_found_in_example
    assert_equal(62, find_encryption_weakness(127,[
        35,
        20,
        15,
        25,
        47,
        40,
        62,
        55,
        65,
        95,
        102,
        117,
        150,
        182,
        127,
        219,
        299,
        277,
        309,
        576
    ]))
  end
end