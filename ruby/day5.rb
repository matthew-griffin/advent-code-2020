def calculate_seat_id(pass_code)
  row_range = 0..127
  column_range = 0..7
  pass_code.each_char do |char|
    if char == 'L'
      column_range = column_range.begin..column_range.begin+column_range.size/2
    elsif char == 'R'
      column_range = column_range.begin+column_range.size/2..column_range.end
    elsif char == 'F'
      row_range = row_range.begin..row_range.begin+row_range.size/2
    elsif char == 'B'
      row_range = row_range.begin+row_range.size/2..row_range.end
    end
  end
  return row_range.begin * 8 + column_range.begin
end

def day_5
  seat_ids = File.foreach("../advent-code-2020/Day5Input.txt").map do |line|
    calculate_seat_id(line)
  end
  puts "Day 5 Part 1 max seat id: #{seat_ids.max}"
  prev_seat_id = -1
  my_seat_id = -1
  seat_ids.sort.each do |id|
    if (prev_seat_id != -1 && prev_seat_id+2 == id)
      my_seat_id = id - 1
      break
    end
    prev_seat_id = id
  end
  puts "Day 5 Part 2 my seat id: #{my_seat_id}"
end