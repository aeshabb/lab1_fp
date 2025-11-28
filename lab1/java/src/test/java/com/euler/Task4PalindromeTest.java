package com.euler;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class Task4PalindromeTest {

    @Test
    public void testIsPalindrome() {
        assertTrue(Task4Palindrome.isPalindrome(9009));
        assertTrue(Task4Palindrome.isPalindrome(9119));
        assertTrue(Task4Palindrome.isPalindrome(1));
        assertTrue(Task4Palindrome.isPalindrome(121));
        assertFalse(Task4Palindrome.isPalindrome(1234));
        assertFalse(Task4Palindrome.isPalindrome(1000));
    }

    @Test
    public void testLargestPalindromeProduct2Digit() {
        int result = Task4Palindrome.largestPalindromeProduct(2);
        assertEquals(9009, result, "Largest palindrome for 2-digit numbers should be 9009");
    }

    @Test
    public void testLargestPalindromeProduct3Digit() {
        int result = Task4Palindrome.largestPalindromeProduct(3);
        assertEquals(906609, result, "Largest palindrome for 3-digit numbers should be 906609");
    }
}
