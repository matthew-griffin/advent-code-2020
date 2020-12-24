require 'minitest/autorun'
require './ruby/day7'

module Minitest::Assertions
  def assert_same_elements(expected, current, msg = nil)
    assert expected_h = expected.each_with_object({}) { |e, h| h[e] ||= expected.select { |i| i == e }.size }
    assert current_h = current.each_with_object({}) { |e, h| h[e] ||= current.select { |i| i == e }.size}

    assert_equal(expected_h, current_h, msg)
  end
end

class Day7Test < MiniTest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_single_rule
    bag_rules = BagRules.new
    bag_rules.add_rule("bright white bags contain 1 shiny gold bag.")
    bag_names = bag_rules.search_possible_containers("shiny gold")
    assert_same_elements(["bright white"], bag_names)
    assert_equal(1, bag_rules.calculate_contained_bags("bright white"))
  end

  def test_second_rule
    bag_rules = BagRules.new
    bag_rules.add_rule("light red bags contain 1 bright white bag, 2 muted yellow bags.")
    bag_rules.add_rule("bright white bags contain 1 shiny gold bag.")
    bag_names = bag_rules.search_possible_containers("shiny gold")
    assert_same_elements(["bright white", "light red"], bag_names)
    assert_equal(4, bag_rules.calculate_contained_bags("light red"))
  end

  def test_example_rules
    bag_rules = BagRules.new
    bag_rules.add_rule("light red bags contain 1 bright white bag, 2 muted yellow bags.")
    bag_rules.add_rule("dark orange bags contain 3 bright white bags, 4 muted yellow bags.")
    bag_rules.add_rule("bright white bags contain 1 shiny gold bag.")
    bag_rules.add_rule("muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.")
    bag_rules.add_rule("shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.")
    bag_rules.add_rule("dark olive bags contain 3 faded blue bags, 4 dotted black bags.")
    bag_rules.add_rule("vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.")
    bag_rules.add_rule("faded blue bags contain no other bags.")
    bag_rules.add_rule("dotted black bags contain no other bags.")
    bag_names = bag_rules.search_possible_containers("shiny gold")
    assert_same_elements(["bright white", "muted yellow", "dark orange", "light red"], bag_names)
    assert_equal(32, bag_rules.calculate_contained_bags("shiny gold"))
  end

  def test_second_example_count
    bag_rules = BagRules.new
    bag_rules.add_rule("shiny gold bags contain 2 dark red bags.")
    bag_rules.add_rule("dark red bags contain 2 dark orange bags.")
    bag_rules.add_rule("dark orange bags contain 2 dark yellow bags.")
    bag_rules.add_rule("dark yellow bags contain 2 dark green bags.")
    bag_rules.add_rule("dark green bags contain 2 dark blue bags.")
    bag_rules.add_rule("dark blue bags contain 2 dark violet bags.")
    bag_rules.add_rule("dark violet bags contain no other bags.")
    assert_equal(126, bag_rules.calculate_contained_bags("shiny gold"))
  end
end