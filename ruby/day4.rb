MANDATORY_FIELDS = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]

FIELD_VALIDATION = {
    "byr" => -> val {val.to_i.between?(1920, 2002)},
    "iyr" => -> val {val.to_i.between?(2010, 2020)},
    "eyr" => -> val {val.to_i.between?(2020, 2030)},
    "hgt" => -> val {
      match = /^(\d+)(in|cm)$/.match(val)
      return false unless match != nil
      if match[2] == "in"
        return match[1].to_i.between?(59, 76)
      else
        return match[1].to_i.between?(150, 193)
      end
    },
    "hcl" => -> val {/^#[\da-f]{6}$/.match?(val)},
    "ecl" => -> val {/^(amb|blu|brn|gry|grn|hzl|oth)$/.match?(val)},
    "pid" => -> val {/^\d{9}$/.match?(val)},
    "cid" => -> val {true}
}

def is_data_valid(input, add_valid=nil)
  fields = input.split(/\s/)
  return false unless fields.length > 6
  field_names = []
  fields.each do |field|
    parts = field.split(':')
    return false unless !add_valid || is_value_valid(parts[0], parts[1])
    field_names.push(parts[0])
  end
  MANDATORY_FIELDS.each { |field|
    return false unless field_names.include? field
  }

  return true
end

def is_value_valid(field, value)
  FIELD_VALIDATION[field].call(value)
end

def count_valid_passports(input, add_valid=nil)
  input.split(/\n{2}/).count{|record| is_data_valid(record, add_valid)}
end

def day_4
  input = File.read("../advent-code-2020/Day4Input.txt")
  puts "Part 1 valid passports: #{count_valid_passports(input)}"
  puts "Part 2 valid passports: #{count_valid_passports(input, true)}"
end