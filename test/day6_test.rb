require 'minitest/autorun'
require './ruby/day6'

class Day6Test < MiniTest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_single_letter_is_one
    assert_equal(1, count_questions_answered("a"))
  end

  def test_two_letters_is_two
    assert_equal(2, count_questions_answered("ab"))
  end

  def test_two_same_letters_is_one
    assert_equal(1, count_questions_answered("a\na"))
  end

  def test_total_example
    input = <<~TEST
      abc

      a
      b
      c
      
      ab
      ac
      
      a
      a
      a
      a
      
      b
    TEST
    assert_equal(11, total_questions_answered(input))
  end

  def test_group_of_one_agreed_on_all_questions
    assert_equal(3, agreed_questions_answered("abc"))
  end

  def test_group_of_three_agreed_on_no_questions
    assert_equal(0, agreed_questions_answered("a\nb\nc"))
  end

  def test_group_example
    input = <<~TEST
      abc

      a
      b
      c
      
      ab
      ac
      
      a
      a
      a
      a
      
      b
    TEST
    assert_equal(6, group_questions_answered(input))
  end
end
