require 'minitest/autorun'
require './ruby/day8'

class Day8Test < MiniTest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_nop_does_nothing
    program = Program.new(["nop +1"])
    assert_equal(0, program.run_until_loop)
  end

  def test_acc_adds_to_accumulator
    program = Program.new(["acc +1"])
    assert_equal(1, program.run_until_loop)
  end

  def test_jmp_runs_correct_next_step
    program = Program.new([
                              "jmp +1",
                              "acc +1"
                          ])
    assert_equal(1, program.run_until_loop)
  end

  def test_jmp_misses_accumulator
    program = Program.new([
      "jmp +2",
      "acc +1"
    ])
    assert_equal(0, program.run_until_loop)
  end

  def test_program_ends_on_loop
    program = Program.new([
      "acc +1",
      "jmp -1"
    ])
    assert_equal(1, program.run_until_loop)
  end

  def test_example_correct
    program = Program.new([
      "nop +0",
      "acc +1",
      "jmp +4",
      "acc +3",
      "jmp -3",
      "acc -99",
      "acc +1",
      "jmp -4",
      "acc +6"
    ])
    assert_equal(5, program.run_until_loop)
  end

  def test_fix_swaps_jmp
    program = Program.new([
      "acc +1",
      "jmp -1",
      "acc +1"
    ])
    assert_equal(2, program.fix_and_run)
  end

  def test_fix_swaps_nop
    program = Program.new([
                              "acc +1",
                              "nop +3",
                              "jmp -1",
                              "jmp -2",
                              "acc +1"
                          ])
    assert_equal(2, program.fix_and_run)
  end

  def test_fixes_example
    program = Program.new([
      "nop +0",
      "acc +1",
      "jmp +4",
      "acc +3",
      "jmp -3",
      "acc -99",
      "acc +1",
      "jmp -4",
      "acc +6"
    ])
    assert_equal(8, program.fix_and_run)
  end

end