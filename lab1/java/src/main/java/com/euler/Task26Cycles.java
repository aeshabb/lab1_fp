package com.euler;

import java.util.HashMap;
import java.util.Map;

/**
 * Project Euler Problem 26: Reciprocal Cycles
 * 
 * Find the value of d < 1000 for which 1/d contains the longest recurring cycle
 * in its decimal fraction part.
 */
public class Task26Cycles {

    /**
     * Вычисляет длину повторяющегося цикла в десятичном представлении 1/d
     */
    public static int cycleLength(int d) {
        Map<Integer, Integer> remainders = new HashMap<>();
        int remainder = 1;
        int position = 0;

        while (remainder != 0 && !remainders.containsKey(remainder)) {
            remainders.put(remainder, position);
            remainder = (remainder * 10) % d;
            position++;
        }

        // Если remainder == 0, значит деление завершилось (нет цикла)
        if (remainder == 0) {
            return 0;
        }

        // Длина цикла = текущая позиция - позиция первого вхождения remainder
        return position - remainders.get(remainder);
    }

    /**
     * Находит число d < limit с наибольшей длиной цикла
     */
    public static int longestCycle(int limit) {
        int maxD = 0;
        int maxLength = 0;

        for (int d = 2; d < limit; d++) {
            int length = cycleLength(d);
            if (length > maxLength) {
                maxLength = length;
                maxD = d;
            }
        }

        return maxD;
    }
}
