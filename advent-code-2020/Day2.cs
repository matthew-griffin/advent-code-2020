using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace advent_of_code_2020
{
    public class Day2 : Task
    {
        public void Execute(string input)
        {
            Console.WriteLine("Day 2!");
            Console.WriteLine($"Valid Passwords = {GetValidPasswordCount(input)}");
        }
        
        public static bool IsPasswordValid(string policyAndPassword)
        {
            var regex = new Regex(@"^(\d+)-(\d+)\s+(\w):\s(\w+)$");
            var match = regex.Match(policyAndPassword);
            if (!match.Success)
                return false;

            var min = Int32.Parse(match.Groups[1].Value);
            var max = Int32.Parse(match.Groups[2].Value);
            var required = char.Parse(match.Groups[3].Value);
            var password = match.Groups[4].Value;
            var reqCount = password.Count(x => x == required);
            return reqCount >= min && reqCount <= max;
        }

        public static int GetValidPasswordCount(string list)
        {
            return list.Split('\n').Count(IsPasswordValid);
        }
    }
}