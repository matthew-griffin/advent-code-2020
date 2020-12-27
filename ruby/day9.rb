def find_first_invalid(preamble_size, input)
  preamble_start = 0
#  preamble_end = preamble_size - 1
  current = preamble_size
  while current < input.size
    found_pair = false
    first = preamble_start
    while first < current - 1
      target = input[current] - input[first]
      second = first + 1
      while second < current
        if input[second] == target
          found_pair = true
          break
        end
        second +=1
      end
      first +=1
    end

    return input[current] unless found_pair == true

    preamble_start += 1
    current += 1
  end
end

def find_encryption_weakness(target, input)
  first = 0
  while first < input.size-1
    total = input[first]
    i = first + 1
    while total < target
      total += input[i]
      if total == target
        sorted_total = input[first..i].sort!
        return sorted_total.first + sorted_total.last
      end
      i+=1
    end
    first +=1
  end
end

def day_9
  input = File.foreach("../advent-code-2020/Day9Input.txt").map do |line|
    line.to_i
  end

  first_invalid = find_first_invalid(25, input)
  puts "Day 9 part 1 first invalid: #{first_invalid}"
  puts "Day 9 part 2 encryption weakness: #{find_encryption_weakness(first_invalid, input)}"
end