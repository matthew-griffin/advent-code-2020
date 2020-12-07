using System;
using System.Linq;
using System.Text.RegularExpressions;

namespace advent_of_code_2020
{
    struct PasswordParts
    {
        public int Pos1;
        public int Pos2;
        public char RequiredChar;
        public string Password;
    }
    
    public class Day2 : Task
    {
        public void Execute(string input)
        {
            Console.WriteLine("Day 2!");
            Console.WriteLine($"Valid Part 1 Passwords = {GetPart1ValidPasswordCount(input)}");
            Console.WriteLine($"Valid Part 2 Passwords = {GetPart2ValidPasswordCount(input)}");
        }
        
        public static bool IsPart1PasswordValid(string policyAndPassword)
        {
            var parts = GetPasswordParts(policyAndPassword);
            if (parts.Password == null)
                return false;
            var reqCount = parts.Password.Count(x => x == parts.RequiredChar);
            return reqCount >= parts.Pos1 && reqCount <= parts.Pos2;
        }

        public static bool IsPart2PasswordValid(string policyAndPassword)
        {
            var parts = GetPasswordParts(policyAndPassword);
            if (parts.Password == null)
                return false;
            return parts.Password
                .Where((x, i) => (i == (parts.Pos1 - 1) || i == (parts.Pos2 - 1)) && x == parts.RequiredChar)
                .Count() == 1;
        }

        public static int GetPart1ValidPasswordCount(string list)
        {
            return list.Split('\n').Count(IsPart1PasswordValid);
        }

        public static int GetPart2ValidPasswordCount(string list)
        {
            return list.Split('\n').Count(IsPart2PasswordValid);
        }

        private static PasswordParts GetPasswordParts(string policyAndPassword)
        {
            var regex = new Regex(@"^(\d+)-(\d+)\s+(\w):\s(\w+)$");
            var match = regex.Match(policyAndPassword);
            if (!match.Success)
                return new PasswordParts();

            return new PasswordParts
            {
                Pos1 = Int32.Parse(match.Groups[1].Value),
                Pos2 = Int32.Parse(match.Groups[2].Value),
                RequiredChar = char.Parse(match.Groups[3].Value),
                Password = match.Groups[4].Value
            };
        }
    }
}