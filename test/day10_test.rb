require 'minitest/autorun'
require './ruby/day10'

class Day10Test < MiniTest::Test
  def test_basic_diff_includes_final_jolt
    assert_equal(2, find_joltage_product([1,2]))
  end

  def test_example
    assert_equal(35, find_joltage_product([
      16,
      10,
      15,
      5,
      1,
      11,
      7,
      19,
      6,
      12,
      4
    ]))
  end

  def test_single_gives_single_combination
    assert_equal(1, find_adaptor_combinations([1]))
  end

  def test_single_gives_single_combination
    assert_equal(1, find_adaptor_combinations([1]))
  end

  def test_one_diff_gives_two_combinations
    assert_equal(2, find_adaptor_combinations([1,2]))
  end

  def test_three_gives_four_combinations
    assert_equal(4, find_adaptor_combinations([1,2,3]))
  end

  def test_first_example
    assert_equal(8, find_adaptor_combinations([
        16,
        10,
        15,
        5,
        1,
        11,
        7,
        19,
        6,
        12,
        4
    ]))
  end

  def test_second_example
    assert_equal(19208, find_adaptor_combinations([
      28,
      33,
      18,
      42,
      31,
      14,
      46,
      20,
      48,
      47,
      24,
      23,
      49,
      45,
      19,
      38,
      39,
      11,
      1,
      32,
      25,
      35,
      8,
      17,
      7,
      9,
      4,
      2,
      34,
      10,
      3
    ]))
  end
end