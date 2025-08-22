import java.util.*;

public class PrimeSieve {
    public static int[] primeSieve(int n) {
        // just so it will compile
        int[] ans = {0,0,1};
        return ans;
    }
           
    public static void test1() {
        int[] ex1 = {0,0,1,1,0,1,0,1,0,0};
        int[] got1 = primeSieve(10);
        System.out.println("Got:");
        System.out.println(Arrays.toString(got1));      
        System.out.println("Expected:");
        System.out.println(Arrays.toString(ex1));
    }
}

