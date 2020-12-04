using System;
using System.Linq;
using System.Text.RegularExpressions;
using advent_of_code_2020;
using NUnit.Framework;

namespace advent_code_2020
{
    [TestFixture]
    public class Day2Tests
    {
        private readonly string exampleInput = "1-3 a: abcde\n" +
                                               "1-3 b: cdefg\n" +
                                               "2-9 c: ccccccccc\n";



        [Test]
        public void ItShouldMarkFirstExampleAsValid()
        {
            Assert.That(Day2.IsPasswordValid("1-3 a: abcde"), Is.True);
        }

        [Test]
        public void ItShouldMarkSecondExampleAsInvalid()
        {
            Assert.That(Day2.IsPasswordValid("1-3 b: cdefg"), Is.False);
        }

        [Test]
        public void ItShouldFindTwoValidPasswordsInExample()
        {
            Assert.That(Day2.GetValidPasswordCount(exampleInput), Is.EqualTo(2));
        }
    }
}