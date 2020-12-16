def count_trees_passed(xvel,yvel,input)
  x = 0
  y = 0
  trees = 0
  rows = input.split "\n"
  columns = rows[0].length
  while y+yvel < rows.length
    x += xvel
    if (x >= columns)
      x -= columns
    end
    y += yvel
    if (rows[y][x] == '#')
      trees += 1
    end
  end
  return trees
end

def day_3
  input = File.read("../advent-code-2020/Day3Input.txt")
  puts "Day 3 Part 1 Trees passed: #{count_trees_passed(3,1,input)}"

  velocities = [[1,1], [3,1], [5,1], [7,1], [1,2]]
  trees_passed = velocities.map{|vel| count_trees_passed(vel[0], vel[1], input)}
  puts "Day 3 Part 2 Tree product: #{trees_passed.inject(:*)}"
end