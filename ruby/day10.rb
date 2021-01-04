
def find_joltage_product(input)
  input.sort!
  one_diff_count = 0
  three_diff_count = 1
  previous_joltage = 0
  input.each do |joltage|
    diff = joltage - previous_joltage
    previous_joltage = joltage
    one_diff_count += 1 unless diff != 1
    three_diff_count += 1 unless diff != 3
  end
  one_diff_count * three_diff_count
end

def find_adaptor_combinations(input)
  input.sort!
  cache = {}
  rec_find_combos(input, 0, 0, cache)
end

def rec_find_combos(input, previous_joltage, current_index, cache)
  found_combinations = 0
  current_step = 3
  while current_step > 0
    target = previous_joltage + current_step
    next_index = find_next_index(input, current_index, target)
    if next_index != nil
      if next_index == input.size - 1
        found_combinations += 1
      else
        unless cache.key?(next_index)
          cache[next_index] = rec_find_combos(input, target, next_index, cache)
        end
        found_combinations += cache[next_index]
      end
    end
    current_step -= 1
  end
  found_combinations
end

def find_next_index(input, current_index, target)
  while current_index < input.size && input[current_index] < target
    current_index +=1
  end
  return nil unless current_index < input.size && input[current_index] == target
  current_index
end

def day_10
  input = File.foreach("../advent-code-2020/Day10Input.txt").map do |line|
    line.to_i
  end
  puts "Day 10 Part 1 Joltage product: #{find_joltage_product(input)}"
  puts "Day 10 Part 2 adaptor combinations: #{find_adaptor_combinations(input)}"
end