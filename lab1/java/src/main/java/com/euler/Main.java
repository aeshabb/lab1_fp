package com.euler;

import java.util.Scanner;

/**
 * Main class для демонстрации решений задач Project Euler
 */
public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("=== Project Euler Solutions ===\n");

        // Задача 4
        System.out.println("Problem 4: Largest Palindrome Product");
        System.out.print("Введите количество цифр (например, 2 или 3): ");
        int digits = scanner.nextInt();
        
        long startTime = System.currentTimeMillis();
        int palindrome = Task4Palindrome.largestPalindromeProduct(digits);
        long endTime = System.currentTimeMillis();
        
        System.out.println("Наибольший палиндром из произведения двух " + digits + 
                           "-значных чисел: " + palindrome);
        System.out.println("Время выполнения: " + (endTime - startTime) + " мс\n");

        // Задача 26
        System.out.println("Problem 26: Reciprocal Cycles");
        System.out.print("Введите верхний предел d (например, 10 или 1000): ");
        int limit = scanner.nextInt();
        
        startTime = System.currentTimeMillis();
        int d = Task26Cycles.longestCycle(limit);
        int cycleLen = Task26Cycles.cycleLength(d);
        endTime = System.currentTimeMillis();
        
        System.out.println("Число d < " + limit + " с наибольшей длиной цикла: " + d);
        System.out.println("Длина цикла: " + cycleLen);
        System.out.println("Время выполнения: " + (endTime - startTime) + " мс");

        scanner.close();
    }
}
