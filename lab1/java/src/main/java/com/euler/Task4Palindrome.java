package com.euler;

/**
 * Project Euler Problem 4: Largest Palindrome Product
 * 
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */
public class Task4Palindrome {

    /**
     * Проверяет, является ли число палиндромом
     */
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

    /**
     * Находит наибольший палиндром, являющийся произведением двух N-значных чисел
     */
    public static int largestPalindromeProduct(int digits) {
        int maxNum = (int) Math.pow(10, digits) - 1;
        int minNum = (int) Math.pow(10, digits - 1);
        int maxPalindrome = 0;

        for (int i = maxNum; i >= minNum; i--) {
            for (int j = i; j >= minNum; j--) {
                int product = i * j;
                
                // Оптимизация: если произведение меньше текущего максимума, прерываем внутренний цикл
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
