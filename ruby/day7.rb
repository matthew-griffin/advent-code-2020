require 'set'

class Bag
  def initialize(name)
    @name = name
    @containers = []
    @bags = []
  end

  attr_accessor :name
  attr_accessor :containers

  def add_container(container)
    @containers.push(container)
  end

  def add_bag(bag, count)
    @bags.push([bag, count])
  end

  def add_container_names(storage)
    @containers.each do |bag|
      if storage.add?(bag.name) != nil
        bag.add_container_names(storage)
      end
    end
  end

  def calculate_contained_bags
    @bags.inject(0) do |sum, bag_pair|
      sum + (bag_pair[0].calculate_contained_bags() + 1) * bag_pair[1]
    end
  end
end

class BagRules
  def initialize
    @bags = Hash.new { |h, k| h[k] = Bag.new(k) }
  end

  def add_rule(rule_text)
    match = /^([\w\s]+) bags contain (.*)\.$/.match(rule_text)
    if (match != nil )
      container_name = match[1]
      container = @bags[container_name]
      bag_list = match[2].split(",")
      bag_list.each do |bag_description|
        sub_match = /(\d+) ([\w\s]+) bags?/.match(bag_description)
        if sub_match != nil
          bag_count = sub_match[1].to_i
          bag_name = sub_match[2]
          container.add_bag(@bags[bag_name], bag_count)
          @bags[bag_name].add_container(container)
        end
      end
    end
  end

  def search_possible_containers(bag_type)
    return [] unless @bags.has_key?(bag_type)
    containers = Set.new
    @bags[bag_type].add_container_names(containers)
    containers
  end

  def calculate_contained_bags(bag_type)
    return 0 unless @bags.has_key?(bag_type)
    @bags[bag_type].calculate_contained_bags()
  end
end

def day_7
  bag_rules = BagRules.new
  File.foreach("../advent-code-2020/Day7Input.txt") do |line|
    bag_rules.add_rule(line)
  end
  puts "Day 7 Part 1 possible bags: #{bag_rules.search_possible_containers("shiny gold").size}"
  puts "Day 7 Part 2 contained bags: #{bag_rules.calculate_contained_bags("shiny gold")}"
end