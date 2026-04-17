/*

(`thumb2019`)
We say a value in an array of ints is a "thumb" value if
it has a value to the left and right, and it is more than 7 away from
both of those values. Replace all of the "thumb" values with the average of its neighbors to the left and right. When the average is not an int, round it.
An exception to this rule is that if either of the neighbor values is 2019, then the number is not considered a "thumb" value. Return the changed array.

Examples:

5. `thumb2019([5,15,31])` => `[5,18,30]`
6. `thumb2019([5,15,2019])` => `[5,15,2019]`
7. `thumb2019([51,15,5])` => `[51,28,5]`
8. `thumb2019([50,15,5])` => `[50,28,5]`
1. `thumb2019([10,30,70,100])` => `[10,40,65,100]`
2. `thumb2019([40,47,54,61])` => `[40,47,54,61]`
3. `thumb2019([40,47,55,2019,65])` => `[40,47,55,60,65]`
4. `thumb2019([1,1,3,4,2019,5,2019])` => `[1,1,3,4,5,5,2019]`
5. `thumb2019([36,47,55,2019,65]`) => `[36,46,55,60,65]`
*/

// omitted "public" class for repl.it

import java.util.*;

class Main {

    /* This is the method you write: */
    public static int[] thumb2019 (int[] nums) {
        return nums;
    }

    public static int testnum = 0 ;
    public static void test1(int[] nums, int correct[]) {
        int[] orig = Arrays.copyOf(nums, nums.length);
        int[] answer = thumb2019(nums);
        String result = "FAIL";
        boolean ok = false;
        if ( Arrays.equals(answer,correct) ) {
            result = "OK";
            ok = true;
        }
        if ( Arrays.equals(orig, nums) ) {
            result += " NO CHANGES MADE";
        }

        testnum += 1;
        System.out.println("Test #"+testnum+": "+result);

        if ( ! ok ) {
            System.out.println("thumb2019("+Arrays.toString(orig)+") = "+Arrays.toString(answer)+")");
        }
    }
    public static void main (String[] args)
    {
        int[] t1 = {5,15,31};
        int[] a1 = {5,18,31};
        test1(t1,a1);

        int[] t2 = {5,15,2019};
        int[] a2 = {5,15,2019};
        test1(t2,a2);

        int[] t3 = {51,15,5};
        int[] a3 = {51,28,5};
        test1(t3,a3);

        int[] t4 = {50,15,5};
        int[] a4 = {50,28,5};
        test1(t4,a4);

        
        int[] t5 = {10,30,70,110};
        int[] a5 = {10,40,75,110}; // 75 or 65 ok
        test1(t5,a5);

        int[] t6 = {40,47,54,61};
        int[] a6 = {40,47,54,61};
        test1(t6,a6);
        
        int[] t7 = {40,47,55,2019,65};
        int[] a7 = {40,47,55,60,65};
        test1(t7,a7);
        
        int[] t8 = {1,1,3,4,2019,5,2019};
        int[] a8 = {1,1,3,4,5,5,2019};
        test1(t8,a8);

        int[] t9 = {36,47,55,2019,65};
        int[] a9 = {36,46,55,60,65};
        test1(t9,a9);
    }
}
