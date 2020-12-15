require 'minitest/autorun'
require './ruby/day4'

class Day4Test < MiniTest::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_first_example_is_valid
    input = <<~TEST
      ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
       byr:1937 iyr:2017 cid:147 hgt:183cm
    TEST

    assert_equal(true, is_data_valid(input))
  end

  def test_second_example_is_invalid_missing_height
    input = <<~TEST
      iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929
    TEST

    assert_equal(false, is_data_valid(input))
  end

  def test_third_example_is_valid_missing_cid
    input = <<~TEST
      hcl:#ae17e1 iyr:2013
      eyr:2024
      ecl:brn pid:760753108 byr:1931
      hgt:179cm
    TEST

    assert_equal(true, is_data_valid(input))
  end

  def test_fourth_example_is_invalid_missing_cid_and_byr
    input = <<~TEST
      hcl:#cfa07d eyr:2025 pid:166559648
      iyr:2011 ecl:brn hgt:59in
    TEST

    assert_equal(false, is_data_valid(input))
  end

  def test_counts_valid_examples
    input = <<~TEST
      ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm
      
      iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929
      
      hcl:#ae17e1 iyr:2013
      eyr:2024
      ecl:brn pid:760753108 byr:1931
      hgt:179cm
      
      hcl:#cfa07d eyr:2025 pid:166559648
      iyr:2011 ecl:brn hgt:59in
    TEST
    assert_equal(2, count_valid_passports(input))
  end

  def test_validates_byr
    assert_equal(false, is_value_valid("byr", "1919"))
    assert_equal(true, is_value_valid("byr", "1920"))
    assert_equal(true, is_value_valid("byr", "2002"))
    assert_equal(false, is_value_valid("byr", "2003"))
  end

  def test_validates_iyr
    assert_equal(false, is_value_valid("iyr", "2009"))
    assert_equal(true, is_value_valid("iyr", "2010"))
    assert_equal(true, is_value_valid("iyr", "2020"))
    assert_equal(false, is_value_valid("iyr", "2021"))
  end

  def test_validates_eyr
    assert_equal(false, is_value_valid("eyr", "2019"))
    assert_equal(true, is_value_valid("eyr", "2020"))
    assert_equal(true, is_value_valid("eyr", "2030"))
    assert_equal(false, is_value_valid("eyr", "2031"))
  end

  def test_validates_hgt
    assert_equal(true, is_value_valid("hgt", "60in"))
    assert_equal(true, is_value_valid("hgt", "190cm"))
    assert_equal(false, is_value_valid("hgt", "190in"))
    assert_equal(false, is_value_valid("hgt", "190"))
  end

  def test_validates_hcl
    assert_equal(true, is_value_valid("hcl", "#123abc"))
    assert_equal(false, is_value_valid("hcl", "#123abz"))
    assert_equal(false, is_value_valid("hcl", "123abc"))
  end

  def test_validates_ecl
    assert_equal(true, is_value_valid("ecl", "amb"))
    assert_equal(true, is_value_valid("ecl", "blu"))
    assert_equal(true, is_value_valid("ecl", "brn"))
    assert_equal(true, is_value_valid("ecl", "gry"))
    assert_equal(true, is_value_valid("ecl", "grn"))
    assert_equal(true, is_value_valid("ecl", "hzl"))
    assert_equal(true, is_value_valid("ecl", "oth"))
    assert_equal(false, is_value_valid("ecl", "wat"))
  end

  def test_validates_pid
    assert_equal(true, is_value_valid("pid", "000000001"))
    assert_equal(false, is_value_valid("pid", "0123456789"))
  end

  def test_cid_always_valid
    assert_equal(true, is_value_valid("cid", "any"))
    assert_equal(true, is_value_valid("cid", "old"))
    assert_equal(true, is_value_valid("cid", "nonsense"))
  end

  def test_counts_valid_examples_part2
    input = <<~TEST
      eyr:1972 cid:100
      hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926
      
      iyr:2019
      hcl:#602927 eyr:1967 hgt:170cm
      ecl:grn pid:012533040 byr:1946
      
      pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
      hcl:#623a2f
      
      eyr:2029 ecl:blu cid:129 byr:1989
      iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm
    TEST
    assert_equal(2, count_valid_passports(input, true))
  end
end