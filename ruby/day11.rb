
class SeatingPattern
  def initialize(pattern_string)
    @pattern = []
    pattern_string.split("\n").each { |line| @pattern.push(line.chars) }
    @rows = @pattern.size
    @columns = @pattern[0].size
  end

  def occupied_seats
    occupied = 0
    @pattern.each { |line| line.each { |char| occupied += 1 if char == '#' }}
    occupied
  end

  def apply
    seats_changed = false
    new_pattern = @pattern.map.with_index do |line, row_index|
      line.map.with_index do |char, col_index|
        next char if char == '.'
        occupied = adjacent_occupied_seats(row_index, col_index)
        if char == 'L' && occupied == 0
          seats_changed = true
          '#'
        elsif char == '#' && occupied >= 4
          seats_changed = true
          'L'
        else
          char
        end
      end
    end
    @pattern = new_pattern
    seats_changed
  end

  def adjacent_occupied_seats(row, column)
    ([0, row-1].max..[@rows-1, row+1].min).reduce(0) do |sum, adj_row|
      sum + ([0, column - 1].max..[@columns - 1, column + 1].min).count do |adj_col|
        (adj_row != row || adj_col != column) && @pattern[adj_row][adj_col] == '#'
      end
    end
  end

  def apply_until_stable
    while apply

    end
    occupied_seats
  end
end

def day_11
  seat_pattern = SeatingPattern.new(File.read("../advent-code-2020/Day11Input.txt"))
  puts "Day 11 Part 1 stable occupied seats: #{seat_pattern.apply_until_stable}"

end