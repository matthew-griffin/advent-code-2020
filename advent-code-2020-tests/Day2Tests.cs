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
        public void ItShouldMarkFirstExampleCorrectly()
        {
            var policyAndPassword = "1-3 a: abcde";
            Assert.That(Day2.IsPart1PasswordValid(policyAndPassword), Is.True);
            Assert.That(Day2.IsPart2PasswordValid(policyAndPassword), Is.True);
        }

        [Test]
        public void ItShouldMarkSecondExampleCorrectly()
        {
            var policyAndPassword = "1-3 b: cdefg";
            Assert.That(Day2.IsPart1PasswordValid(policyAndPassword), Is.False);
            Assert.That(Day2.IsPart2PasswordValid(policyAndPassword), Is.False);
        }

        [Test]
        public void ItShouldFindCorrectValidPasswordCountFromExample()
        {
            Assert.That(Day2.GetPart1ValidPasswordCount(exampleInput), Is.EqualTo(2));
            Assert.That(Day2.GetPart2ValidPasswordCount(exampleInput), Is.EqualTo(1));
        }
    }
}
