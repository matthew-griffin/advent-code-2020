require 'set'

class Program
  def initialize(instructions)
    @instructions = instructions
    Struct.new('Result', :success, :acc, :visited_pcs)
  end

  def run_until_loop
    run_instructions.acc
  end

  def fix_and_run
    run_instructions.visited_pcs.each do |pc|
      if can_swap_instruction?(pc)
        swap_instruction!(pc)
        result = run_instructions
        swap_instruction!(pc)
        if result.success
          return result.acc
        end
      end
    end
  end

  def run_instructions
    pc = 0
    acc = 0
    visited_pcs = Set.new
    while pc < @instructions.size && visited_pcs.add?(pc) != nil
      instruction = @instructions[pc].split(" ")
      if instruction[0] == "acc"
        acc += instruction[1].to_i
      end
      if instruction[0] == "jmp"
        pc += instruction[1].to_i
      else
        pc+=1
      end
    end
    Struct::Result.new(pc >= @instructions.size, acc, visited_pcs)
  end

  def can_swap_instruction?(pc)
    @instructions[pc].start_with?("jmp", "nop")
  end

  def swap_instruction!(pc)
    if @instructions[pc].start_with?("jmp")
      @instructions[pc].gsub!("jmp", "nop")
    elsif @instructions[pc].start_with?("nop")
      @instructions[pc].gsub!("nop", "jmp")
    end
  end

end

def day_8
  program = Program.new(File.read("../advent-code-2020/Day8Input.txt").split("\n"))
  puts "Day 8 Part 1 acc value: #{program.run_until_loop()}"
  puts "Day 8 Part 2 acc value: #{program.fix_and_run()}"
end