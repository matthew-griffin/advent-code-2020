using System;
using System.IO;

namespace advent_of_code_2020
{
    class Program
    {
        static void Main(string[] args)
        {
            var day = args[0];
            var inputFile = args[1];
            var dayTask = new Day2();
            var input = File.ReadAllText(inputFile);
            dayTask.Execute(input);
        }
    }
}