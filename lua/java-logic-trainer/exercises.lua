local M = {}

local function ex(t) return t end

M.list = {
ex{
  id="is-even", title="Check whether a number is even", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static boolean isEven(int number)

Return true when number is even and false when it is odd.

Rules:
- Zero is even.
- Negative numbers can be even too.
- Do not use Strings or text conversion.

Examples:
isEven(4) -> true
isEven(7) -> false
isEven(0) -> true
isEven(-2) -> true]],
  starter_code=[[public class Exercise {
    public static boolean isEven(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isEven(4));
assertFalse(Exercise.isEven(7));
assertTrue(Exercise.isEven(0));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsEvenNumbers(){ assertTrue(Exercise.isEven(4)); assertTrue(Exercise.isEven(-2)); }
 @Test void detectsOddNumbers(){ assertFalse(Exercise.isEven(7)); assertFalse(Exercise.isEven(-3)); }
 @Test void zeroIsEven(){ assertTrue(Exercise.isEven(0)); }
}]],
  hints={"Use the modulo operator %.","A number is even when number % 2 is 0.","The same rule works with negative numbers."}
},
ex{
  id="max-of-three", title="Maximum of three numbers", level="beginner", difficulty=1, topic="conditionals",
  description=[[Implement the method:

public static int maxOfThree(int a, int b, int c)

Return the largest of three integers.

Rules:
- Must work with negative numbers.
- If values are tied, return the tied maximum value.
- Do not use arrays for this exercise.

Examples:
maxOfThree(1, 8, 3) -> 8
maxOfThree(-5, -2, -9) -> -2
maxOfThree(4, 4, 1) -> 4]],
  starter_code=[[public class Exercise {
    public static int maxOfThree(int a, int b, int c) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(8, Exercise.maxOfThree(1, 8, 3));
assertEquals(-2, Exercise.maxOfThree(-5, -2, -9));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void findsMiddleMaximum(){ assertEquals(8, Exercise.maxOfThree(1,8,3)); }
 @Test void worksWithNegatives(){ assertEquals(-2, Exercise.maxOfThree(-5,-2,-9)); }
 @Test void handlesTies(){ assertEquals(4, Exercise.maxOfThree(4,4,1)); assertEquals(9, Exercise.maxOfThree(9,2,9)); }
 @Test void firstAndLastCanWin(){ assertEquals(10, Exercise.maxOfThree(10,1,2)); assertEquals(10, Exercise.maxOfThree(1,2,10)); }
}]],
  hints={"Keep a temporary maximum.","Compare b with the maximum, then compare c.","You can also use Math.max twice."}
},
ex{
  id="count-vowels", title="Count vowels", level="beginner", difficulty=1, topic="strings",
  description=[[Implement the method:

public static int countVowels(String text)

Return how many vowels appear in the received text.

Rules:
- Count only a, e, i, o, u.
- Count uppercase and lowercase as the same.
- Do not count accented vowels.
- If text is null or empty, return 0.
- Do not use regular expressions.

Examples:
countVowels("Hello") -> 2
countVowels("JAVA") -> 2
countVowels(null) -> 0]],
  starter_code=[[public class Exercise {
    public static int countVowels(String text) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countVowels("hello"));
assertEquals(2, Exercise.countVowels("JAVA"));
assertEquals(0, Exercise.countVowels(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsLowercaseVowels(){ assertEquals(2, Exercise.countVowels("hello")); }
 @Test void countsUppercaseVowels(){ assertEquals(2, Exercise.countVowels("JAVA")); }
 @Test void returnsZeroForEmptyAndNull(){ assertEquals(0, Exercise.countVowels("")); assertEquals(0, Exercise.countVowels(null)); }
 @Test void ignoresAccentsAndConsonants(){ assertEquals(0, Exercise.countVowels("xyz\u00e1\u00e9\u00ed\u00f3\u00fa")); }
}]],
  hints={"Loop through the String character by character.","Convert each character to lowercase.","Check whether \"aeiou\".indexOf(ch) >= 0."}
},
ex{
  id="palindrome-word", title="Palindrome word", level="beginner", difficulty=1, topic="strings",
  description=[[Implement the method:

public static boolean isPalindrome(String text)

Return true if the text reads the same from left to right and right to left.

Rules:
- Ignore uppercase/lowercase differences.
- Do not ignore spaces or punctuation.
- null must return false.
- The empty String must return true.

Examples:
isPalindrome("Level") -> true
isPalindrome("java") -> false]],
  starter_code=[[public class Exercise {
    public static boolean isPalindrome(String text) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isPalindrome("Level"));
assertFalse(Exercise.isPalindrome("java"));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsPalindromesIgnoringCase(){ assertTrue(Exercise.isPalindrome("Level")); assertTrue(Exercise.isPalindrome("Racecar")); }
 @Test void rejectsNonPalindromes(){ assertFalse(Exercise.isPalindrome("java")); }
 @Test void handlesEmptyAndNull(){ assertTrue(Exercise.isPalindrome("")); assertFalse(Exercise.isPalindrome(null)); }
 @Test void doesNotIgnoreSpaces(){ assertFalse(Exercise.isPalindrome("nurses run")); }
}]],
  hints={"Use two indexes: start and end.","Compare lowercase characters.","Move start forward and end backward while they match."}
},
ex{
  id="sum-digits", title="Sum digits", level="beginner", difficulty=1, topic="loops",
  description=[[Implement the method:

public static int sumDigits(int number)

Return the sum of the decimal digits of the number.

Rules:
- If the number is negative, use its absolute value.
- sumDigits(0) must return 0.
- Do not convert the number to a String.

Examples:
sumDigits(123) -> 6
sumDigits(-49) -> 13]],
  starter_code=[[public class Exercise {
    public static int sumDigits(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(6, Exercise.sumDigits(123));
assertEquals(13, Exercise.sumDigits(-49));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void sumsPositiveDigits(){ assertEquals(6, Exercise.sumDigits(123)); assertEquals(1, Exercise.sumDigits(1000)); }
 @Test void handlesNegativeNumbers(){ assertEquals(13, Exercise.sumDigits(-49)); }
 @Test void handlesZero(){ assertEquals(0, Exercise.sumDigits(0)); }
}]],
  hints={"Use % 10 to get the last digit.","Use / 10 to remove the last digit.","Work with Math.abs(number)."}
},
ex{
  id="factorial-loop", title="Factorial with a loop", level="beginner", difficulty=1, topic="loops",
  description=[[Implement the method:

public static long factorial(int n)

Return n! using a loop.

Rules:
- 0! and 1! are 1.
- If n is negative, return -1.
- Do not use recursion.

Examples:
factorial(5) -> 120
factorial(0) -> 1
factorial(-3) -> -1]],
  starter_code=[[public class Exercise {
    public static long factorial(int n) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(120, Exercise.factorial(5));
assertEquals(1, Exercise.factorial(0));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void calculatesFactorial(){ assertEquals(120, Exercise.factorial(5)); assertEquals(3628800, Exercise.factorial(10)); }
 @Test void handlesZeroAndOne(){ assertEquals(1, Exercise.factorial(0)); assertEquals(1, Exercise.factorial(1)); }
 @Test void rejectsNegative(){ assertEquals(-1, Exercise.factorial(-3)); }
}]],
  hints={"Initialize the result to 1.","Multiply from 2 through n.","Check negative values before the loop."}
},
ex{
  id="is-prime", title="Check whether a number is prime", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isPrime(int number)

Return true if number is prime.

Rules:
- Numbers lower than 2 are not prime.
- 2 is prime.
- You do not need to test divisors greater than the square root.

Examples:
isPrime(2) -> true
isPrime(9) -> false
isPrime(17) -> true]],
  starter_code=[[public class Exercise {
    public static boolean isPrime(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isPrime(2));
assertFalse(Exercise.isPrime(9));
assertTrue(Exercise.isPrime(17));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void handlesSmallNumbers(){ assertFalse(Exercise.isPrime(-1)); assertFalse(Exercise.isPrime(0)); assertFalse(Exercise.isPrime(1)); assertTrue(Exercise.isPrime(2)); }
 @Test void detectsPrimes(){ assertTrue(Exercise.isPrime(17)); assertTrue(Exercise.isPrime(97)); }
 @Test void detectsCompositeNumbers(){ assertFalse(Exercise.isPrime(4)); assertFalse(Exercise.isPrime(9)); assertFalse(Exercise.isPrime(100)); }
}]],
  hints={"Reject numbers lower than 2.","Test divisors starting at 2.","You can use i * i <= number as the loop condition."}
},
ex{
  id="count-char", title="Count character occurrences", level="beginner", difficulty=2, topic="strings",
  description=[[Implement the method:

public static int countChar(String text, char target)

Count how many times target appears in text.

Rules:
- The comparison is case-sensitive.
- If text is null or empty, return 0.
- Do not use replace or regular expressions.

Examples:
countChar("banana", 'a') -> 3
countChar("Java", 'j') -> 0]],
  starter_code=[[public class Exercise {
    public static int countChar(String text, char target) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(3, Exercise.countChar("banana", 'a'));
assertEquals(0, Exercise.countChar("Java", 'j'));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsOccurrences(){ assertEquals(3, Exercise.countChar("banana", 'a')); assertEquals(2, Exercise.countChar("mamma", 'm')); }
 @Test void isCaseSensitive(){ assertEquals(0, Exercise.countChar("Java", 'j')); assertEquals(1, Exercise.countChar("Java", 'J')); }
 @Test void handlesNullAndEmpty(){ assertEquals(0, Exercise.countChar(null, 'x')); assertEquals(0, Exercise.countChar("", 'x')); }
}]],
  hints={"Loop over every index in the String.","Compare with charAt(i).","Increment a counter when it matches."}
},
ex{
  id="reverse-string", title="Reverse a String", level="beginner", difficulty=2, topic="strings",
  description=[[Implement the method:

public static String reverse(String text)

Return a new String with the characters in reverse order.

Rules:
- If text is null, return null.
- If text is empty, return "".
- Use StringBuilder or a loop.

Examples:
reverse("java") -> "avaj"
reverse("a") -> "a"]],
  starter_code=[[public class Exercise {
    public static String reverse(String text) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertEquals("avaj", Exercise.reverse("java"));
assertNull(Exercise.reverse(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void reversesText(){ assertEquals("avaj", Exercise.reverse("java")); assertEquals("cba", Exercise.reverse("abc")); }
 @Test void handlesSingleAndEmpty(){ assertEquals("a", Exercise.reverse("a")); assertEquals("", Exercise.reverse("")); }
 @Test void handlesNull(){ assertNull(Exercise.reverse(null)); }
}]],
  hints={"StringBuilder has a reverse() method.","You can also loop from the end to the start.","Handle null before building the result."}
},
ex{
  id="leap-year", title="Validate leap year", level="beginner", difficulty=2, topic="conditionals",
  description=[[Implement the method:

public static boolean isLeapYear(int year)

Return true if the year is a leap year.

Rules:
- A year divisible by 400 is a leap year.
- A year divisible by 100 but not by 400 is not a leap year.
- A year divisible by 4 and not by 100 is a leap year.
- Years lower than or equal to 0 return false.

Examples:
isLeapYear(2020) -> true
isLeapYear(1900) -> false
isLeapYear(2000) -> true]],
  starter_code=[[public class Exercise {
    public static boolean isLeapYear(int year) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isLeapYear(2020));
assertFalse(Exercise.isLeapYear(1900));
assertTrue(Exercise.isLeapYear(2000));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsCommonLeapYears(){ assertTrue(Exercise.isLeapYear(2020)); assertTrue(Exercise.isLeapYear(2024)); }
 @Test void handlesCenturyRules(){ assertFalse(Exercise.isLeapYear(1900)); assertTrue(Exercise.isLeapYear(2000)); }
 @Test void rejectsInvalidAndCommonYears(){ assertFalse(Exercise.isLeapYear(0)); assertFalse(Exercise.isLeapYear(-4)); assertFalse(Exercise.isLeapYear(2023)); }
}]],
  hints={"Check year <= 0 first.","The 400 rule has priority over the 100 rule.","Use the % operator."}
},
ex{
  id="array-sum", title="Sum an array", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int sum(int[] numbers)

Return the sum of all elements.

Rules:
- If numbers is null, return 0.
- If it is empty, return 0.
- Must work with negative numbers.

Examples:
sum(new int[]{1,2,3}) -> 6
sum(new int[]{-2,5}) -> 3]],
  starter_code=[[public class Exercise {
    public static int sum(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(6, Exercise.sum(new int[]{1,2,3}));
assertEquals(0, Exercise.sum(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void sumsNumbers(){ assertEquals(6, Exercise.sum(new int[]{1,2,3})); assertEquals(3, Exercise.sum(new int[]{-2,5})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.sum(new int[]{})); assertEquals(0, Exercise.sum(null)); }
}]],
  hints={"Initialize an accumulator to 0.","Loop with for-each.","Check null before the loop."}
},
ex{
  id="array-max", title="Largest array element", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int max(int[] numbers)

Return the largest element in the array.

Rules:
- If numbers is null or empty, return Integer.MIN_VALUE.
- Must work when all numbers are negative.

Examples:
max(new int[]{1,9,3}) -> 9
max(new int[]{-7,-2}) -> -2]],
  starter_code=[[public class Exercise {
    public static int max(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(9, Exercise.max(new int[]{1,9,3}));
assertEquals(Integer.MIN_VALUE, Exercise.max(new int[]{}));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void findsMax(){ assertEquals(9, Exercise.max(new int[]{1,9,3})); assertEquals(5, Exercise.max(new int[]{5})); }
 @Test void worksWithNegatives(){ assertEquals(-2, Exercise.max(new int[]{-7,-2,-9})); }
 @Test void handlesEmptyAndNull(){ assertEquals(Integer.MIN_VALUE, Exercise.max(new int[]{})); assertEquals(Integer.MIN_VALUE, Exercise.max(null)); }
}]],
  hints={"Do not start the maximum at 0.","Use the first element as the initial maximum.","First check null or length == 0."}
},
ex{
  id="second-largest", title="Second largest value", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int secondLargest(int[] numbers)

Return the second largest distinct value.

Rules:
- If there is no second distinct value, return Integer.MIN_VALUE.
- Ignore duplicates of the maximum.
- Must work with negative numbers.

Examples:
secondLargest(new int[]{5,1,9,9,3}) -> 5
secondLargest(new int[]{4,4}) -> Integer.MIN_VALUE]],
  starter_code=[[public class Exercise {
    public static int secondLargest(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(5, Exercise.secondLargest(new int[]{5,1,9,9,3}));
assertEquals(Integer.MIN_VALUE, Exercise.secondLargest(new int[]{4,4}));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void findsSecondDistinctLargest(){ assertEquals(5, Exercise.secondLargest(new int[]{5,1,9,9,3})); assertEquals(2, Exercise.secondLargest(new int[]{1,2,3})); }
 @Test void handlesMissingSecond(){ assertEquals(Integer.MIN_VALUE, Exercise.secondLargest(new int[]{4,4})); assertEquals(Integer.MIN_VALUE, Exercise.secondLargest(new int[]{1})); assertEquals(Integer.MIN_VALUE, Exercise.secondLargest(null)); }
 @Test void worksWithNegatives(){ assertEquals(-5, Exercise.secondLargest(new int[]{-10,-5,-2})); }
}]],
  hints={"Track the largest and second largest values.","Update second when you find a value between both.","Ignore values equal to the largest."}
},
ex{
  id="count-signs", title="Count positives, negatives, and zeros", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int[] countSigns(int[] numbers)

Return a three-element array: [positives, negatives, zeros].

Rules:
- If numbers is null, return [0,0,0].
- 0 is neither positive nor negative.
- Preserve exactly that result order.

Examples:
countSigns(new int[]{-1,0,2,3}) -> [2,1,1]],
  starter_code=[[public class Exercise {
    public static int[] countSigns(int[] numbers) {
        // TODO: implement your solution
        return new int[]{0, 0, 0};
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{2,1,1}, Exercise.countSigns(new int[]{-1,0,2,3}));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsAllSigns(){ assertArrayEquals(new int[]{2,1,1}, Exercise.countSigns(new int[]{-1,0,2,3})); }
 @Test void handlesOnlyZeros(){ assertArrayEquals(new int[]{0,0,3}, Exercise.countSigns(new int[]{0,0,0})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{0,0,0}, Exercise.countSigns(new int[]{})); assertArrayEquals(new int[]{0,0,0}, Exercise.countSigns(null)); }
}]],
  hints={"Create three counters.","Use if, else if, else.","Return new int[]{positives, negatives, zeros}."}
},
ex{
  id="is-sorted", title="Check whether an array is sorted", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static boolean isSortedAscending(int[] numbers)

Return true if the array is sorted from lowest to highest.

Rules:
- Repeated values are allowed.
- null, empty arrays, and single-element arrays return true.
- Do not sort the array.

Examples:
isSortedAscending(new int[]{1,2,2,5}) -> true
isSortedAscending(new int[]{1,3,2}) -> false]],
  starter_code=[[public class Exercise {
    public static boolean isSortedAscending(int[] numbers) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isSortedAscending(new int[]{1,2,2,5}));
assertFalse(Exercise.isSortedAscending(new int[]{1,3,2}));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsSortedArrays(){ assertTrue(Exercise.isSortedAscending(new int[]{1,2,2,5})); assertTrue(Exercise.isSortedAscending(new int[]{-3,-1,0})); }
 @Test void detectsUnsortedArrays(){ assertFalse(Exercise.isSortedAscending(new int[]{1,3,2})); }
 @Test void handlesShortInputs(){ assertTrue(Exercise.isSortedAscending(null)); assertTrue(Exercise.isSortedAscending(new int[]{})); assertTrue(Exercise.isSortedAscending(new int[]{7})); }
}]],
  hints={"Compare each element with the previous one.","If numbers[i] < numbers[i - 1], return false.","If the loop finishes, return true."}
},
ex{
  id="reverse-array", title="Reverse an array", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] reverse(int[] numbers)

Return a new array with the elements reversed.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- If it is empty, return an empty array.

Examples:
reverse(new int[]{1,2,3}) -> [3,2,1]],
  starter_code=[[public class Exercise {
    public static int[] reverse(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{3,2,1}, Exercise.reverse(new int[]{1,2,3}));
assertNull(Exercise.reverse(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void reversesArray(){ assertArrayEquals(new int[]{3,2,1}, Exercise.reverse(new int[]{1,2,3})); }
 @Test void doesNotMutateOriginal(){ int[] input={1,2}; Exercise.reverse(input); assertArrayEquals(new int[]{1,2}, input); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.reverse(new int[]{})); assertNull(Exercise.reverse(null)); }
}]],
  hints={"Create a result array with the same length.","The destination index can be length - 1 - i.","Do not write into numbers."}
},
ex{
  id="remove-duplicates-array", title="Remove duplicates preserving order", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] removeDuplicates(int[] numbers)

Return the values without duplicates, preserving the first occurrence.

Rules:
- If numbers is null, return an empty array.
- Preserve the original order.
- You may use LinkedHashSet.

Examples:
removeDuplicates(new int[]{3,1,3,2,1}) -> [3,1,2]],
  starter_code=[[public class Exercise {
    public static int[] removeDuplicates(int[] numbers) {
        // TODO: implement your solution
        return new int[]{};
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{3,1,2}, Exercise.removeDuplicates(new int[]{3,1,3,2,1}));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void removesDuplicatesPreservingOrder(){ assertArrayEquals(new int[]{3,1,2}, Exercise.removeDuplicates(new int[]{3,1,3,2,1})); }
 @Test void handlesNoDuplicates(){ assertArrayEquals(new int[]{1,2,3}, Exercise.removeDuplicates(new int[]{1,2,3})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.removeDuplicates(new int[]{})); assertArrayEquals(new int[]{}, Exercise.removeDuplicates(null)); }
}]],
  hints={"LinkedHashSet preserves insertion order.","Then convert the set to int[].","Without collections, count unique values and copy them manually."}
},
ex{
  id="most-frequent-number", title="Most frequent number", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int mostFrequent(int[] numbers)

Return the number that appears most often.

Rules:
- If there is a tie, return the one that appeared first in the array.
- If numbers is null or empty, return 0.
- You may use HashMap.

Examples:
mostFrequent(new int[]{4,2,4,3,2,4}) -> 4
mostFrequent(new int[]{9,8,8,9}) -> 9]],
  starter_code=[[public class Exercise {
    public static int mostFrequent(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(4, Exercise.mostFrequent(new int[]{4,2,4,3,2,4}));
assertEquals(9, Exercise.mostFrequent(new int[]{9,8,8,9}));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void findsMostFrequent(){ assertEquals(4, Exercise.mostFrequent(new int[]{4,2,4,3,2,4})); }
 @Test void tieReturnsFirstAppearing(){ assertEquals(9, Exercise.mostFrequent(new int[]{9,8,8,9})); }
 @Test void handlesSingleEmptyAndNull(){ assertEquals(7, Exercise.mostFrequent(new int[]{7})); assertEquals(0, Exercise.mostFrequent(new int[]{})); assertEquals(0, Exercise.mostFrequent(null)); }
}]],
  hints={"Count frequencies with Map<Integer, Integer>.","Update the best value only when a frequency is greater than the best frequency.","Do not update on ties, so the first value remains."}
},
ex{
  id="rotate-right", title="Rotate an array to the right", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] rotateRight(int[] numbers, int positions)

Return a new array rotated to the right.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- If it is empty, return an empty array.
- positions may be greater than length.
- If positions is negative, treat it as 0.

Examples:
rotateRight(new int[]{1,2,3,4}, 1) -> [4,1,2,3]
rotateRight(new int[]{1,2,3}, 4) -> [3,1,2]],
  starter_code=[[public class Exercise {
    public static int[] rotateRight(int[] numbers, int positions) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{4,1,2,3}, Exercise.rotateRight(new int[]{1,2,3,4}, 1));
assertArrayEquals(new int[]{3,1,2}, Exercise.rotateRight(new int[]{1,2,3}, 4));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void rotatesRight(){ assertArrayEquals(new int[]{4,1,2,3}, Exercise.rotateRight(new int[]{1,2,3,4}, 1)); }
 @Test void normalizesPositions(){ assertArrayEquals(new int[]{3,1,2}, Exercise.rotateRight(new int[]{1,2,3}, 4)); }
 @Test void handlesNegativeEmptyAndNull(){ assertArrayEquals(new int[]{1,2}, Exercise.rotateRight(new int[]{1,2}, -1)); assertArrayEquals(new int[]{}, Exercise.rotateRight(new int[]{}, 3)); assertNull(Exercise.rotateRight(null, 1)); }
 @Test void doesNotMutateOriginal(){ int[] input={1,2,3}; Exercise.rotateRight(input,1); assertArrayEquals(new int[]{1,2,3}, input); }
}]],
  hints={"Normalize positions with positions % length.","For each index i, its destination is (i + positions) % length.","Create a new result array."}
},
ex{
  id="merge-sorted-arrays", title="Merge sorted arrays", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] mergeSorted(int[] a, int[] b)

Merge two already sorted ascending arrays into a new sorted array.

Rules:
- null is treated as an empty array.
- Preserve duplicates.
- Do not use Arrays.sort on the result.

Examples:
mergeSorted(new int[]{1,3}, new int[]{2,4}) -> [1,2,3,4]
mergeSorted(new int[]{1,1}, new int[]{1}) -> [1,1,1]],
  starter_code=[[public class Exercise {
    public static int[] mergeSorted(int[] a, int[] b) {
        // TODO: implement your solution
        return new int[]{};
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{1,2,3,4}, Exercise.mergeSorted(new int[]{1,3}, new int[]{2,4}));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void mergesSortedArrays(){ assertArrayEquals(new int[]{1,2,3,4}, Exercise.mergeSorted(new int[]{1,3}, new int[]{2,4})); }
 @Test void preservesDuplicates(){ assertArrayEquals(new int[]{1,1,1}, Exercise.mergeSorted(new int[]{1,1}, new int[]{1})); }
 @Test void handlesNullAndEmpty(){ assertArrayEquals(new int[]{2}, Exercise.mergeSorted(null, new int[]{2})); assertArrayEquals(new int[]{}, Exercise.mergeSorted(null, null)); }
}]],
  hints={"Use two indexes, one for each array.","Copy the smaller current value into the result.","When one array ends, copy the remainder of the other one."}
},
ex{
  id="absolute-value", title="Absolute value", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int absoluteValue(int number)

Return the absolute value of number.

Rules:
- Positive numbers stay the same.
- Negative numbers become positive.
- Zero returns zero.]],
  starter_code=[[public class Exercise {
    public static int absoluteValue(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(5, Exercise.absoluteValue(-5));
assertEquals(3, Exercise.absoluteValue(3));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void convertsNegatives(){ assertEquals(5, Exercise.absoluteValue(-5)); }
 @Test void keepsNonNegatives(){ assertEquals(3, Exercise.absoluteValue(3)); assertEquals(0, Exercise.absoluteValue(0)); }
}]],
  hints={"Check whether the number is negative.","If it is negative, multiply by -1.","Otherwise return it unchanged."}
},
ex{
  id="can-vote", title="Can vote", level="beginner", difficulty=1, topic="conditionals",
  description=[[Implement the method:

public static boolean canVote(int age)

Return true when age is at least 18.

Rules:
- Ages below 18 return false.
- Negative ages return false.]],
  starter_code=[[public class Exercise {
    public static boolean canVote(int age) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.canVote(18));
assertFalse(Exercise.canVote(17));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void acceptsAdults(){ assertTrue(Exercise.canVote(18)); assertTrue(Exercise.canVote(30)); }
 @Test void rejectsMinorsAndInvalid(){ assertFalse(Exercise.canVote(17)); assertFalse(Exercise.canVote(-1)); }
}]],
  hints={"Use a comparison operator.","The boundary is 18.","age >= 18 is the key expression."}
},
ex{
  id="rectangle-area", title="Rectangle area", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int rectangleArea(int width, int height)

Return width multiplied by height.

Rules:
- If width or height is negative, return 0.
- Zero is allowed and returns 0.]],
  starter_code=[[public class Exercise {
    public static int rectangleArea(int width, int height) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(12, Exercise.rectangleArea(3,4));
assertEquals(0, Exercise.rectangleArea(-3,4));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void calculatesArea(){ assertEquals(12, Exercise.rectangleArea(3,4)); }
 @Test void rejectsNegativeSides(){ assertEquals(0, Exercise.rectangleArea(-3,4)); assertEquals(0, Exercise.rectangleArea(3,-4)); }
 @Test void allowsZero(){ assertEquals(0, Exercise.rectangleArea(0,9)); }
}]],
  hints={"Validate the inputs first.","Area is width * height.","Return 0 for invalid dimensions."}
},
ex{
  id="minutes-to-seconds", title="Minutes to seconds", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int minutesToSeconds(int minutes)

Return the number of seconds in minutes.

Rules:
- One minute has 60 seconds.
- Negative minutes return 0.]],
  starter_code=[[public class Exercise {
    public static int minutesToSeconds(int minutes) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(120, Exercise.minutesToSeconds(2));
assertEquals(0, Exercise.minutesToSeconds(-1));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void convertsMinutes(){ assertEquals(120, Exercise.minutesToSeconds(2)); assertEquals(60, Exercise.minutesToSeconds(1)); }
 @Test void handlesZeroAndNegative(){ assertEquals(0, Exercise.minutesToSeconds(0)); assertEquals(0, Exercise.minutesToSeconds(-1)); }
}]],
  hints={"Check negative values.","Multiply by 60.","Zero naturally gives zero."}
},
ex{
  id="first-character", title="First character", level="beginner", difficulty=1, topic="strings",
  description=[[Implement the method:

public static char firstChar(String text)

Return the first character of text.

Rules:
- If text is null or empty, return '\0'.]],
  starter_code=[[public class Exercise {
    public static char firstChar(String text) {
        // TODO: implement your solution
        return '\0';
    }
}]],
  visible_tests=[[assertEquals('J', Exercise.firstChar("Java"));
assertEquals('\0', Exercise.firstChar(""));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void returnsFirstCharacter(){ assertEquals('J', Exercise.firstChar("Java")); }
 @Test void handlesMissingText(){ assertEquals('\0', Exercise.firstChar("")); assertEquals('\0', Exercise.firstChar(null)); }
}]],
  hints={"Check null first.","Check isEmpty().","Use charAt(0)."}
},
ex{
  id="add-1", title="Add 1", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add1(int number)

Return number plus 1.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add1(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(6, Exercise.add1(5));
assertEquals(-1, Exercise.add1(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(6, Exercise.add1(5)); assertEquals(-1, Exercise.add1(-2)); }
 @Test void handlesZero(){ assertEquals(1, Exercise.add1(0)); }
}]],
  hints={"Use the + operator.","Add 1 to the input.","Return the computed value."}
},
ex{
  id="add-2", title="Add 2", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add2(int number)

Return number plus 2.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add2(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(7, Exercise.add2(5));
assertEquals(0, Exercise.add2(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(7, Exercise.add2(5)); assertEquals(0, Exercise.add2(-2)); }
 @Test void handlesZero(){ assertEquals(2, Exercise.add2(0)); }
}]],
  hints={"Use the + operator.","Add 2 to the input.","Return the computed value."}
},
ex{
  id="add-3", title="Add 3", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add3(int number)

Return number plus 3.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add3(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(8, Exercise.add3(5));
assertEquals(1, Exercise.add3(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(8, Exercise.add3(5)); assertEquals(1, Exercise.add3(-2)); }
 @Test void handlesZero(){ assertEquals(3, Exercise.add3(0)); }
}]],
  hints={"Use the + operator.","Add 3 to the input.","Return the computed value."}
},
ex{
  id="add-4", title="Add 4", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add4(int number)

Return number plus 4.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add4(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(9, Exercise.add4(5));
assertEquals(2, Exercise.add4(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(9, Exercise.add4(5)); assertEquals(2, Exercise.add4(-2)); }
 @Test void handlesZero(){ assertEquals(4, Exercise.add4(0)); }
}]],
  hints={"Use the + operator.","Add 4 to the input.","Return the computed value."}
},
ex{
  id="add-5", title="Add 5", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add5(int number)

Return number plus 5.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add5(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(10, Exercise.add5(5));
assertEquals(3, Exercise.add5(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(10, Exercise.add5(5)); assertEquals(3, Exercise.add5(-2)); }
 @Test void handlesZero(){ assertEquals(5, Exercise.add5(0)); }
}]],
  hints={"Use the + operator.","Add 5 to the input.","Return the computed value."}
},
ex{
  id="add-6", title="Add 6", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add6(int number)

Return number plus 6.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add6(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(11, Exercise.add6(5));
assertEquals(4, Exercise.add6(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(11, Exercise.add6(5)); assertEquals(4, Exercise.add6(-2)); }
 @Test void handlesZero(){ assertEquals(6, Exercise.add6(0)); }
}]],
  hints={"Use the + operator.","Add 6 to the input.","Return the computed value."}
},
ex{
  id="add-7", title="Add 7", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add7(int number)

Return number plus 7.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add7(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(12, Exercise.add7(5));
assertEquals(5, Exercise.add7(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(12, Exercise.add7(5)); assertEquals(5, Exercise.add7(-2)); }
 @Test void handlesZero(){ assertEquals(7, Exercise.add7(0)); }
}]],
  hints={"Use the + operator.","Add 7 to the input.","Return the computed value."}
},
ex{
  id="add-8", title="Add 8", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add8(int number)

Return number plus 8.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add8(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(13, Exercise.add8(5));
assertEquals(6, Exercise.add8(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(13, Exercise.add8(5)); assertEquals(6, Exercise.add8(-2)); }
 @Test void handlesZero(){ assertEquals(8, Exercise.add8(0)); }
}]],
  hints={"Use the + operator.","Add 8 to the input.","Return the computed value."}
},
ex{
  id="add-9", title="Add 9", level="beginner", difficulty=1, topic="numbers",
  description=[[Implement the method:

public static int add9(int number)

Return number plus 9.

Rules:
- Must work with negative numbers.
- Do not convert to text.]],
  starter_code=[[public class Exercise {
    public static int add9(int number) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(14, Exercise.add9(5));
assertEquals(7, Exercise.add9(-2));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void addsConstant(){ assertEquals(14, Exercise.add9(5)); assertEquals(7, Exercise.add9(-2)); }
 @Test void handlesZero(){ assertEquals(9, Exercise.add9(0)); }
}]],
  hints={"Use the + operator.","Add 9 to the input.","Return the computed value."}
},
ex{
  id="multiple-of-2", title="Multiple of 2", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf2(int number)

Return true when number is divisible by 2.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf2(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf2(6));
assertFalse(Exercise.isMultipleOf2(7));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf2(6)); assertTrue(Exercise.isMultipleOf2(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf2(7)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf2(-4)); }
}]],
  hints={"Use the modulo operator %.","number % 2 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-3", title="Multiple of 3", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf3(int number)

Return true when number is divisible by 3.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf3(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf3(9));
assertFalse(Exercise.isMultipleOf3(10));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf3(9)); assertTrue(Exercise.isMultipleOf3(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf3(10)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf3(-6)); }
}]],
  hints={"Use the modulo operator %.","number % 3 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-4", title="Multiple of 4", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf4(int number)

Return true when number is divisible by 4.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf4(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf4(12));
assertFalse(Exercise.isMultipleOf4(13));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf4(12)); assertTrue(Exercise.isMultipleOf4(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf4(13)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf4(-8)); }
}]],
  hints={"Use the modulo operator %.","number % 4 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-5", title="Multiple of 5", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf5(int number)

Return true when number is divisible by 5.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf5(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf5(15));
assertFalse(Exercise.isMultipleOf5(16));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf5(15)); assertTrue(Exercise.isMultipleOf5(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf5(16)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf5(-10)); }
}]],
  hints={"Use the modulo operator %.","number % 5 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-6", title="Multiple of 6", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf6(int number)

Return true when number is divisible by 6.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf6(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf6(18));
assertFalse(Exercise.isMultipleOf6(19));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf6(18)); assertTrue(Exercise.isMultipleOf6(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf6(19)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf6(-12)); }
}]],
  hints={"Use the modulo operator %.","number % 6 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-7", title="Multiple of 7", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf7(int number)

Return true when number is divisible by 7.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf7(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf7(21));
assertFalse(Exercise.isMultipleOf7(22));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf7(21)); assertTrue(Exercise.isMultipleOf7(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf7(22)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf7(-14)); }
}]],
  hints={"Use the modulo operator %.","number % 7 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-8", title="Multiple of 8", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf8(int number)

Return true when number is divisible by 8.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf8(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf8(24));
assertFalse(Exercise.isMultipleOf8(25));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf8(24)); assertTrue(Exercise.isMultipleOf8(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf8(25)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf8(-16)); }
}]],
  hints={"Use the modulo operator %.","number % 8 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-9", title="Multiple of 9", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf9(int number)

Return true when number is divisible by 9.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf9(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf9(27));
assertFalse(Exercise.isMultipleOf9(28));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf9(27)); assertTrue(Exercise.isMultipleOf9(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf9(28)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf9(-18)); }
}]],
  hints={"Use the modulo operator %.","number % 9 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-10", title="Multiple of 10", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf10(int number)

Return true when number is divisible by 10.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf10(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf10(30));
assertFalse(Exercise.isMultipleOf10(31));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf10(30)); assertTrue(Exercise.isMultipleOf10(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf10(31)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf10(-20)); }
}]],
  hints={"Use the modulo operator %.","number % 10 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-11", title="Multiple of 11", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf11(int number)

Return true when number is divisible by 11.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf11(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf11(33));
assertFalse(Exercise.isMultipleOf11(34));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf11(33)); assertTrue(Exercise.isMultipleOf11(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf11(34)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf11(-22)); }
}]],
  hints={"Use the modulo operator %.","number % 11 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-12", title="Multiple of 12", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf12(int number)

Return true when number is divisible by 12.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf12(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf12(36));
assertFalse(Exercise.isMultipleOf12(37));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf12(36)); assertTrue(Exercise.isMultipleOf12(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf12(37)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf12(-24)); }
}]],
  hints={"Use the modulo operator %.","number % 12 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-13", title="Multiple of 13", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf13(int number)

Return true when number is divisible by 13.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf13(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf13(39));
assertFalse(Exercise.isMultipleOf13(40));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf13(39)); assertTrue(Exercise.isMultipleOf13(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf13(40)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf13(-26)); }
}]],
  hints={"Use the modulo operator %.","number % 13 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-14", title="Multiple of 14", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf14(int number)

Return true when number is divisible by 14.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf14(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf14(42));
assertFalse(Exercise.isMultipleOf14(43));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf14(42)); assertTrue(Exercise.isMultipleOf14(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf14(43)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf14(-28)); }
}]],
  hints={"Use the modulo operator %.","number % 14 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-15", title="Multiple of 15", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf15(int number)

Return true when number is divisible by 15.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf15(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf15(45));
assertFalse(Exercise.isMultipleOf15(46));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf15(45)); assertTrue(Exercise.isMultipleOf15(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf15(46)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf15(-30)); }
}]],
  hints={"Use the modulo operator %.","number % 15 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-16", title="Multiple of 16", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf16(int number)

Return true when number is divisible by 16.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf16(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf16(48));
assertFalse(Exercise.isMultipleOf16(49));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf16(48)); assertTrue(Exercise.isMultipleOf16(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf16(49)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf16(-32)); }
}]],
  hints={"Use the modulo operator %.","number % 16 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="multiple-of-17", title="Multiple of 17", level="beginner", difficulty=2, topic="numbers",
  description=[[Implement the method:

public static boolean isMultipleOf17(int number)

Return true when number is divisible by 17.

Rules:
- Zero is a multiple.
- Negative numbers can be multiples.
- Do not use Strings.]],
  starter_code=[[public class Exercise {
    public static boolean isMultipleOf17(int number) {
        // TODO: implement your solution
        return false;
    }
}]],
  visible_tests=[[assertTrue(Exercise.isMultipleOf17(51));
assertFalse(Exercise.isMultipleOf17(52));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void detectsMultiples(){ assertTrue(Exercise.isMultipleOf17(51)); assertTrue(Exercise.isMultipleOf17(0)); }
 @Test void rejectsNonMultiples(){ assertFalse(Exercise.isMultipleOf17(52)); }
 @Test void handlesNegatives(){ assertTrue(Exercise.isMultipleOf17(-34)); }
}]],
  hints={"Use the modulo operator %.","number % 17 == 0 means divisible.","The same rule works for zero and negatives."}
},
ex{
  id="count-greater-than-1", title="Count values greater than 1", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan1(int[] numbers)

Return how many values in the array are greater than 1.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 1 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan1(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan1(new int[]{1,2,3}));
assertEquals(0, Exercise.countGreaterThan1(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan1(new int[]{1,2,3})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan1(new int[]{0,1,-1})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan1(new int[]{})); assertEquals(0, Exercise.countGreaterThan1(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-2", title="Count values greater than 2", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan2(int[] numbers)

Return how many values in the array are greater than 2.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 2 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan2(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan2(new int[]{2,3,4}));
assertEquals(0, Exercise.countGreaterThan2(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan2(new int[]{2,3,4})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan2(new int[]{1,2,0})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan2(new int[]{})); assertEquals(0, Exercise.countGreaterThan2(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-3", title="Count values greater than 3", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan3(int[] numbers)

Return how many values in the array are greater than 3.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 3 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan3(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan3(new int[]{3,4,5}));
assertEquals(0, Exercise.countGreaterThan3(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan3(new int[]{3,4,5})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan3(new int[]{2,3,1})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan3(new int[]{})); assertEquals(0, Exercise.countGreaterThan3(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-4", title="Count values greater than 4", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan4(int[] numbers)

Return how many values in the array are greater than 4.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 4 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan4(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan4(new int[]{4,5,6}));
assertEquals(0, Exercise.countGreaterThan4(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan4(new int[]{4,5,6})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan4(new int[]{3,4,2})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan4(new int[]{})); assertEquals(0, Exercise.countGreaterThan4(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-5", title="Count values greater than 5", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan5(int[] numbers)

Return how many values in the array are greater than 5.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 5 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan5(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan5(new int[]{5,6,7}));
assertEquals(0, Exercise.countGreaterThan5(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan5(new int[]{5,6,7})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan5(new int[]{4,5,3})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan5(new int[]{})); assertEquals(0, Exercise.countGreaterThan5(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-6", title="Count values greater than 6", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan6(int[] numbers)

Return how many values in the array are greater than 6.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 6 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan6(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan6(new int[]{6,7,8}));
assertEquals(0, Exercise.countGreaterThan6(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan6(new int[]{6,7,8})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan6(new int[]{5,6,4})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan6(new int[]{})); assertEquals(0, Exercise.countGreaterThan6(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-7", title="Count values greater than 7", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan7(int[] numbers)

Return how many values in the array are greater than 7.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 7 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan7(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan7(new int[]{7,8,9}));
assertEquals(0, Exercise.countGreaterThan7(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan7(new int[]{7,8,9})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan7(new int[]{6,7,5})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan7(new int[]{})); assertEquals(0, Exercise.countGreaterThan7(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-8", title="Count values greater than 8", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan8(int[] numbers)

Return how many values in the array are greater than 8.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 8 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan8(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan8(new int[]{8,9,10}));
assertEquals(0, Exercise.countGreaterThan8(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan8(new int[]{8,9,10})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan8(new int[]{7,8,6})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan8(new int[]{})); assertEquals(0, Exercise.countGreaterThan8(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-9", title="Count values greater than 9", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan9(int[] numbers)

Return how many values in the array are greater than 9.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 9 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan9(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan9(new int[]{9,10,11}));
assertEquals(0, Exercise.countGreaterThan9(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan9(new int[]{9,10,11})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan9(new int[]{8,9,7})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan9(new int[]{})); assertEquals(0, Exercise.countGreaterThan9(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-10", title="Count values greater than 10", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan10(int[] numbers)

Return how many values in the array are greater than 10.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 10 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan10(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan10(new int[]{10,11,12}));
assertEquals(0, Exercise.countGreaterThan10(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan10(new int[]{10,11,12})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan10(new int[]{9,10,8})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan10(new int[]{})); assertEquals(0, Exercise.countGreaterThan10(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-11", title="Count values greater than 11", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan11(int[] numbers)

Return how many values in the array are greater than 11.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 11 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan11(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan11(new int[]{11,12,13}));
assertEquals(0, Exercise.countGreaterThan11(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan11(new int[]{11,12,13})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan11(new int[]{10,11,9})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan11(new int[]{})); assertEquals(0, Exercise.countGreaterThan11(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-12", title="Count values greater than 12", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan12(int[] numbers)

Return how many values in the array are greater than 12.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 12 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan12(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan12(new int[]{12,13,14}));
assertEquals(0, Exercise.countGreaterThan12(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan12(new int[]{12,13,14})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan12(new int[]{11,12,10})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan12(new int[]{})); assertEquals(0, Exercise.countGreaterThan12(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-13", title="Count values greater than 13", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan13(int[] numbers)

Return how many values in the array are greater than 13.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 13 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan13(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan13(new int[]{13,14,15}));
assertEquals(0, Exercise.countGreaterThan13(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan13(new int[]{13,14,15})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan13(new int[]{12,13,11})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan13(new int[]{})); assertEquals(0, Exercise.countGreaterThan13(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-14", title="Count values greater than 14", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan14(int[] numbers)

Return how many values in the array are greater than 14.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 14 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan14(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan14(new int[]{14,15,16}));
assertEquals(0, Exercise.countGreaterThan14(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan14(new int[]{14,15,16})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan14(new int[]{13,14,12})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan14(new int[]{})); assertEquals(0, Exercise.countGreaterThan14(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="count-greater-than-15", title="Count values greater than 15", level="intermediate", difficulty=3, topic="arrays",
  description=[[Implement the method:

public static int countGreaterThan15(int[] numbers)

Return how many values in the array are greater than 15.

Rules:
- If numbers is null, return 0.
- Empty arrays return 0.
- Values equal to 15 do not count.]],
  starter_code=[[public class Exercise {
    public static int countGreaterThan15(int[] numbers) {
        // TODO: implement your solution
        return 0;
    }
}]],
  visible_tests=[[assertEquals(2, Exercise.countGreaterThan15(new int[]{15,16,17}));
assertEquals(0, Exercise.countGreaterThan15(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void countsGreaterValues(){ assertEquals(2, Exercise.countGreaterThan15(new int[]{15,16,17})); }
 @Test void ignoresEqualAndSmaller(){ assertEquals(0, Exercise.countGreaterThan15(new int[]{14,15,13})); }
 @Test void handlesEmptyAndNull(){ assertEquals(0, Exercise.countGreaterThan15(new int[]{})); assertEquals(0, Exercise.countGreaterThan15(null)); }
}]],
  hints={"Check null before looping.","Use a counter.","Increment when value is greater than the threshold."}
},
ex{
  id="clamp-array-min-1", title="Clamp array minimum 1", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin1(int[] numbers)

Return a new array where every value below 1 is replaced with 1.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 1 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin1(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{1,1,3}, Exercise.clampMin1(new int[]{0,1,3}));
assertNull(Exercise.clampMin1(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{1,1,3}, Exercise.clampMin1(new int[]{0,1,3})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin1(new int[]{})); assertNull(Exercise.clampMin1(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{0}; Exercise.clampMin1(input); assertArrayEquals(new int[]{0}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-2", title="Clamp array minimum 2", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin2(int[] numbers)

Return a new array where every value below 2 is replaced with 2.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 2 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin2(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{2,2,4}, Exercise.clampMin2(new int[]{1,2,4}));
assertNull(Exercise.clampMin2(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{2,2,4}, Exercise.clampMin2(new int[]{1,2,4})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin2(new int[]{})); assertNull(Exercise.clampMin2(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{1}; Exercise.clampMin2(input); assertArrayEquals(new int[]{1}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-3", title="Clamp array minimum 3", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin3(int[] numbers)

Return a new array where every value below 3 is replaced with 3.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 3 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin3(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{3,3,5}, Exercise.clampMin3(new int[]{2,3,5}));
assertNull(Exercise.clampMin3(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{3,3,5}, Exercise.clampMin3(new int[]{2,3,5})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin3(new int[]{})); assertNull(Exercise.clampMin3(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{2}; Exercise.clampMin3(input); assertArrayEquals(new int[]{2}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-4", title="Clamp array minimum 4", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin4(int[] numbers)

Return a new array where every value below 4 is replaced with 4.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 4 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin4(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{4,4,6}, Exercise.clampMin4(new int[]{3,4,6}));
assertNull(Exercise.clampMin4(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{4,4,6}, Exercise.clampMin4(new int[]{3,4,6})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin4(new int[]{})); assertNull(Exercise.clampMin4(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{3}; Exercise.clampMin4(input); assertArrayEquals(new int[]{3}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-5", title="Clamp array minimum 5", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin5(int[] numbers)

Return a new array where every value below 5 is replaced with 5.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 5 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin5(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{5,5,7}, Exercise.clampMin5(new int[]{4,5,7}));
assertNull(Exercise.clampMin5(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{5,5,7}, Exercise.clampMin5(new int[]{4,5,7})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin5(new int[]{})); assertNull(Exercise.clampMin5(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{4}; Exercise.clampMin5(input); assertArrayEquals(new int[]{4}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-6", title="Clamp array minimum 6", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin6(int[] numbers)

Return a new array where every value below 6 is replaced with 6.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 6 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin6(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{6,6,8}, Exercise.clampMin6(new int[]{5,6,8}));
assertNull(Exercise.clampMin6(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{6,6,8}, Exercise.clampMin6(new int[]{5,6,8})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin6(new int[]{})); assertNull(Exercise.clampMin6(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{5}; Exercise.clampMin6(input); assertArrayEquals(new int[]{5}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-7", title="Clamp array minimum 7", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin7(int[] numbers)

Return a new array where every value below 7 is replaced with 7.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 7 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin7(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{7,7,9}, Exercise.clampMin7(new int[]{6,7,9}));
assertNull(Exercise.clampMin7(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{7,7,9}, Exercise.clampMin7(new int[]{6,7,9})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin7(new int[]{})); assertNull(Exercise.clampMin7(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{6}; Exercise.clampMin7(input); assertArrayEquals(new int[]{6}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-8", title="Clamp array minimum 8", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin8(int[] numbers)

Return a new array where every value below 8 is replaced with 8.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 8 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin8(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{8,8,10}, Exercise.clampMin8(new int[]{7,8,10}));
assertNull(Exercise.clampMin8(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{8,8,10}, Exercise.clampMin8(new int[]{7,8,10})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin8(new int[]{})); assertNull(Exercise.clampMin8(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{7}; Exercise.clampMin8(input); assertArrayEquals(new int[]{7}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-9", title="Clamp array minimum 9", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin9(int[] numbers)

Return a new array where every value below 9 is replaced with 9.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 9 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin9(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{9,9,11}, Exercise.clampMin9(new int[]{8,9,11}));
assertNull(Exercise.clampMin9(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{9,9,11}, Exercise.clampMin9(new int[]{8,9,11})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin9(new int[]{})); assertNull(Exercise.clampMin9(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{8}; Exercise.clampMin9(input); assertArrayEquals(new int[]{8}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-10", title="Clamp array minimum 10", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin10(int[] numbers)

Return a new array where every value below 10 is replaced with 10.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 10 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin10(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{10,10,12}, Exercise.clampMin10(new int[]{9,10,12}));
assertNull(Exercise.clampMin10(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{10,10,12}, Exercise.clampMin10(new int[]{9,10,12})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin10(new int[]{})); assertNull(Exercise.clampMin10(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{9}; Exercise.clampMin10(input); assertArrayEquals(new int[]{9}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-11", title="Clamp array minimum 11", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin11(int[] numbers)

Return a new array where every value below 11 is replaced with 11.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 11 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin11(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{11,11,13}, Exercise.clampMin11(new int[]{10,11,13}));
assertNull(Exercise.clampMin11(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{11,11,13}, Exercise.clampMin11(new int[]{10,11,13})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin11(new int[]{})); assertNull(Exercise.clampMin11(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{10}; Exercise.clampMin11(input); assertArrayEquals(new int[]{10}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-12", title="Clamp array minimum 12", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin12(int[] numbers)

Return a new array where every value below 12 is replaced with 12.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 12 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin12(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{12,12,14}, Exercise.clampMin12(new int[]{11,12,14}));
assertNull(Exercise.clampMin12(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{12,12,14}, Exercise.clampMin12(new int[]{11,12,14})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin12(new int[]{})); assertNull(Exercise.clampMin12(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{11}; Exercise.clampMin12(input); assertArrayEquals(new int[]{11}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-13", title="Clamp array minimum 13", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin13(int[] numbers)

Return a new array where every value below 13 is replaced with 13.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 13 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin13(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{13,13,15}, Exercise.clampMin13(new int[]{12,13,15}));
assertNull(Exercise.clampMin13(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{13,13,15}, Exercise.clampMin13(new int[]{12,13,15})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin13(new int[]{})); assertNull(Exercise.clampMin13(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{12}; Exercise.clampMin13(input); assertArrayEquals(new int[]{12}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-14", title="Clamp array minimum 14", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin14(int[] numbers)

Return a new array where every value below 14 is replaced with 14.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 14 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin14(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{14,14,16}, Exercise.clampMin14(new int[]{13,14,16}));
assertNull(Exercise.clampMin14(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{14,14,16}, Exercise.clampMin14(new int[]{13,14,16})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin14(new int[]{})); assertNull(Exercise.clampMin14(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{13}; Exercise.clampMin14(input); assertArrayEquals(new int[]{13}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
},
ex{
  id="clamp-array-min-15", title="Clamp array minimum 15", level="intermediate", difficulty=4, topic="arrays",
  description=[[Implement the method:

public static int[] clampMin15(int[] numbers)

Return a new array where every value below 15 is replaced with 15.

Rules:
- Do not modify the original array.
- If numbers is null, return null.
- Values greater than or equal to 15 stay unchanged.]],
  starter_code=[[public class Exercise {
    public static int[] clampMin15(int[] numbers) {
        // TODO: implement your solution
        return null;
    }
}]],
  visible_tests=[[assertArrayEquals(new int[]{15,15,17}, Exercise.clampMin15(new int[]{14,15,17}));
assertNull(Exercise.clampMin15(null));]],
  hidden_tests=[[import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
class ExerciseTest {
 @Test void clampsLowValues(){ assertArrayEquals(new int[]{15,15,17}, Exercise.clampMin15(new int[]{14,15,17})); }
 @Test void handlesEmptyAndNull(){ assertArrayEquals(new int[]{}, Exercise.clampMin15(new int[]{})); assertNull(Exercise.clampMin15(null)); }
 @Test void doesNotMutateOriginal(){ int[] input=new int[]{14}; Exercise.clampMin15(input); assertArrayEquals(new int[]{14}, input); }
}]],
  hints={"Create a new array.","Copy each value unless it is too small.","Use Math.max(value, minimum) if you want."}
}
}

function M.all()
  return M.list
end

function M.by_id(id)
  for _, exercise in ipairs(M.list) do
    if exercise.id == id then return exercise end
  end
end

function M.available(progress)
  local result = {}
  local max_difficulty = progress.currentDifficulty or 1
  for _, exercise in ipairs(M.list) do
    if exercise.difficulty <= max_difficulty then
      table.insert(result, exercise)
    end
  end
  return result
end

function M.next_pending(progress)
  local max_difficulty = progress.currentDifficulty or 1
  for _, exercise in ipairs(M.list) do
    if exercise.difficulty <= max_difficulty then
      local done = false
      for _, id in ipairs(progress.completed or {}) do
        if id == exercise.id then done = true break end
      end
      if not done then return exercise end
    end
  end
  for _, exercise in ipairs(M.list) do
    local done = false
    for _, id in ipairs(progress.completed or {}) do
      if id == exercise.id then done = true break end
    end
    if not done then return exercise end
  end
end

return M
