def count_questions_answered(input)
  input.gsub(/\s+/, "").chars.to_a.uniq.length
end

def agreed_questions_answered(input)
  question_counts = Hash.new {|h,k| h[k] = 0}
  group_answers = input.split
  group_answers.each do |answers|
    answers.each_char do |char|
      question_counts[char] += 1
    end
  end
  question_counts.count do |_, value|
    value == group_answers.size
  end
end

def total_questions_answered(input)
  input.split(/\n{2}/).inject(0) do |sum, group|
    sum + count_questions_answered(group)
  end
end

def group_questions_answered(input)
  input.split(/\n{2}/).inject(0) do |sum, group|
    sum + agreed_questions_answered(group)
  end
end

def day_6
  input = File.read("../advent-code-2020/Day6Input.txt")
  puts "Day 6 Part 1 total questions answered: #{total_questions_answered(input)}"
  puts "Day 6 Part 2 group questions answered: #{group_questions_answered(input)}"
end