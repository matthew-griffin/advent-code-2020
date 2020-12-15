require 'minitest/autorun'
require './ruby/Day3'

class Day3Test < MiniTest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_it_should_pass_0_trees
    input = <<~MAP
      ....
      ....
    MAP
    assert_equal(0, count_trees_passed(3, 1, input))
  end

  def test_it_should_pass_1_tree
    input = <<~MAP
      ....
      ...#
    MAP
    assert_equal(1, count_trees_passed(3, 1, input))
  end

  def test_it_should_pass_2_trees
    input = <<~MAP
      ....
      ...#
      ..#.
    MAP
    assert_equal(2, count_trees_passed(3, 1, input))
  end

  def test_it_should_pass_7_trees
    input = <<~MAP
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
    MAP
    assert_equal(7, count_trees_passed(3, 1, input))
  end

  def test_it_should_pass_a_tree_each_line
    input = <<~MAP
      .........
      ...#.....
      ......#..
      #........
    MAP
    assert_equal(3, count_trees_passed(3, 1, input))
  end
end