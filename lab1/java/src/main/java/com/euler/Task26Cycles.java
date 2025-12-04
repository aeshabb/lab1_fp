package com.euler;

import java.util.HashMap;
import java.util.Map;

public class Task26Cycles {

    public static int cycleLength(int d) {
        Map<Integer, Integer> remainders = new HashMap<>();
        int remainder = 1;
        int position = 0;

        while (remainder != 0 && !remainders.containsKey(remainder)) {
            remainders.put(remainder, position);
            remainder = (remainder * 10) % d;
            position++;
        }

        if (remainder == 0) {
            return 0;
        }
        return position - remainders.get(remainder);
    }

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
