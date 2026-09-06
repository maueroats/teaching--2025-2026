import org.junit.*;
import org.junit.runner.*;
import static org.junit.Assert.*;

public class NoTrees {

    public static String[] noTrees (String[] xs) {
        return xs;
    }

    @Test
    public void test_simple_1() {
        String [] input = {"tree"};
        String [] correct = {"grass"};
        String [] answer = noTrees(input);
        assertArrayEquals(correct,answer);
    }

    @Test
    public void test_simple_2() {
        String [] input = {"bush"};
        String [] correct = {"bush"};
        String [] answer = noTrees(input);
        assertArrayEquals(correct,answer);
    }

    @Test
    public void test_long() {
        String [] input = {"tree","tree","bush","tree","tree"};
        String [] correct = {"bush","grass","grass","grass","grass"};
        String [] answer = noTrees(input);
        assertArrayEquals(correct,answer);
    }

}
