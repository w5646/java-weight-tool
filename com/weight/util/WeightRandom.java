package com.weight.util;

import java.util.Random;

public class WeightRandom {   // ← 加 public
    private static final Random RAND = new Random();
    
    public static String pick(String[] options, int[] weights) {
        int total = 0;
        for (int w : weights) total += w;
        int num = RAND.nextInt(total);
        int sum = 0;
        for (int i = 0; i < options.length; i++) {
            sum += weights[i];
            if (num < sum) return options[i];
        }
        return options[options.length - 1];
    }
    
    public static <T> T random(T[] options) {
        return options[RAND.nextInt(options.length)];
    }
}