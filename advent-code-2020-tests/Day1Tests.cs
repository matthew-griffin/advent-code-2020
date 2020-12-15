using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using NUnit.Framework.Constraints;

namespace advent_code_2020
{
    public class Day1Tests
    {
        private static int Calculate2020Product(int factors, List<int> input)
        {
            var foundFactors = FindSumFactors(input, 0, factors, 2020);
            return foundFactors.Aggregate(1, (acc, x) => acc * x);
        }

        private static List<int> FindSumFactors(List<int> input, int start, int factors, int targetSum)
        {
            for (var i = start; i < input.Count; i++)
            {
                var current = input[i];
                var nextTarget = targetSum - current;
                if (factors > 1)
                {
                    var subFactors = FindSumFactors(input, i + 1, factors - 1, nextTarget);
                    if (subFactors.Count != factors - 1) 
                        continue;
                    subFactors.Add(current);
                    return subFactors;
                }

                if (input[i] == targetSum)
                    return new List<int>{targetSum};
            }
            return new List<int>();
        }

        [SetUp]
        public void Setup()
        {
            
        }
        
        [Test]
        public void ItShouldReturnZeroWhenTwoValues()
        {
            var input = new List<int>() {0, 2020};
            Assert.That(Calculate2020Product(2, input), Is.Zero);
        }

        [Test]
        public void ItShouldReturn2019ForTwoValues()
        {
            var input = new List<int>() {1, 2019};
            Assert.That(Calculate2020Product(2, input), Is.EqualTo(2019));
        }

        [Test]
        public void ItShouldCalculateDay1Example()
        {
            Assert.That(Calculate2020Product(2, _exampleInput), Is.EqualTo(514579));
        }

        [Test]
        public void ItShouldCalculateDay1Result()
        {
            Assert.That(Calculate2020Product(2, _realInput), Is.EqualTo(898299));
        }

        [Test]
        public void ItShouldCalculatePart2Example()
        {
            Assert.That(Calculate2020Product(3, _exampleInput), Is.EqualTo(241861950));
        }
        
        [Test]
        public void ItShouldCalculatePart2Result()
        {
            Assert.That(Calculate2020Product(3, _realInput), Is.EqualTo(143933922));
        }
        
        private readonly List<int> _exampleInput = new List<int>() {1721, 979, 366, 299, 675, 1456};
        
        private readonly List<int> _realInput = new List<int> {
            1810,
                1729,
                1857,
                1777,
                1927,
                1936,
                1797,
                1719,
                1703,
                1758,
                1768,
                2008,
                1963,
                1925,
                1919,
                1911,
                1782,
                2001,
                1744,
                1738,
                1742,
                1799,
                1765,
                1819,
                1888,
                127,
                1880,
                1984,
                1697,
                1760,
                1680,
                1951,
                1745,
                1817,
                1704,
                1736,
                1969,
                1705,
                1690,
                1848,
                1885,
                1912,
                1982,
                1895,
                1959,
                1769,
                1722,
                1807,
                1901,
                1983,
                1993,
                1871,
                1795,
                1955,
                1921,
                1934,
                1743,
                1899,
                1942,
                1964,
                1034,
                1952,
                1851,
                1716,
                1800,
                1771,
                1945,
                1877,
                1917,
                1930,
                1970,
                1948,
                1914,
                1767,
                1910,
                563,
                1121,
                1897,
                1946,
                1882,
                1739,
                1900,
                1714,
                1931,
                2000,
                311,
                1881,
                1876,
                354,
                1965,
                1842,
                1979,
                1998,
                1960,
                1852,
                1847,
                1938,
                1369,
                1780,
                1698,
                1753,
                1746,
                1868,
                1752,
                1802,
                1892,
                1755,
                1818,
                1913,
                1706,
                1862,
                326 ,
                1941,
                1926,
                1809,
                1879,
                1815,
                1939,
                1859,
                1999,
                1947,
                1898,
                1794,
                1737,
                1971,
                1977,
                1944,
                1812,
                1905,
                1359,
                1788,
                1754,
                1774,
                1825,
                1748,
                1701,
                1791,
                1786,
                1692,
                1894,
                1961,
                1902,
                1849,
                1967,
                1770,
                1987,
                1831,
                1728,
                1896,
                1805,
                1733,
                1918,
                1731,
                661 ,
                1776,
                1494,
                2005,
                2009,
                2004,
                1915,
                1695,
                1710,
                1804,
                1929,
                1725,
                1772,
                1933,
                609 ,
                1708,
                1822,
                1978,
                1811,
                1816,
                1073,
                1874,
                1845,
                1989,
                1696,
                1953,
                1823,
                1923,
                1907,
                1834,
                1806,
                1861,
                1785,
                297 ,
                1968,
                1764,
                1932,
                1937,
                1826,
                1732,
                1962,
                1916,
                1756,
                1975,
                1775,
                1922,
                1773};
    }
}