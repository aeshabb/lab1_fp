package com.euler;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class Task26CyclesTest {

    @Test
    public void testCycleLength() {
        assertEquals(1, Task26Cycles.cycleLength(3), "1/3 should have cycle length 1");
        assertEquals(1, Task26Cycles.cycleLength(6), "1/6 should have cycle length 1"); // 0.1(6)
        assertEquals(6, Task26Cycles.cycleLength(7), "1/7 should have cycle length 6");
        assertEquals(1, Task26Cycles.cycleLength(9), "1/9 should have cycle length 1");
        assertEquals(0, Task26Cycles.cycleLength(2), "1/2 should have cycle length 0"); // 0.5
        assertEquals(0, Task26Cycles.cycleLength(4), "1/4 should have cycle length 0"); // 0.25
    }

    @Test
    public void testLongestCycleUnder10() {
        int result = Task26Cycles.longestCycle(10);
        assertEquals(7, result, "d < 10 with longest cycle should be 7");
    }

    @Test
    public void testLongestCycleUnder100() {
        int result = Task26Cycles.longestCycle(100);
        assertEquals(97, result, "d < 100 with longest cycle should be 97");
    }

    @Test
    public void testLongestCycleUnder1000() {
        int result = Task26Cycles.longestCycle(1000);
        assertEquals(983, result, "d < 1000 with longest cycle should be 983");
    }
}
