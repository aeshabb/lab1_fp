package com.euler;

public class Task4Palindrome {

    public static boolean isPalindrome(int n) {
        String str = String.valueOf(n);
        int len = str.length();
        for (int i = 0; i < len / 2; i++) {
            if (str.charAt(i) != str.charAt(len - 1 - i)) {
                return false;
            }
        }
        return true;
    }

    public static int largestPalindromeProduct(int digits) {
        int maxNum = (int) Math.pow(10, digits) - 1;
        int minNum = (int) Math.pow(10, digits - 1);
        int maxPalindrome = 0;

        for (int i = maxNum; i >= minNum; i--) {
            for (int j = i; j >= minNum; j--) {
                int product = i * j;
                
                if (product <= maxPalindrome) {
                    break;
                }
                
                if (isPalindrome(product)) {
                    maxPalindrome = Math.max(maxPalindrome, product);
                }
            }
        }

        return maxPalindrome;
    }
}
