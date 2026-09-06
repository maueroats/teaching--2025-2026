import org.junit.*;
import org.junit.runner.*;
import static org.junit.Assert.*;

// You can put all of your tests in one class.
public class SticksOut {

    public static String[] sticksOut(String[] xs)
    {
        return xs;
    }

    @Test
    public void test_trivial() {
        String[] xs = { };
        String[] answer = sticksOut(xs);
        assertArrayEquals(xs,answer);
        assertEquals(0, xs.length);
    }
    @Test
    public void test_one() {
        String[] xs = { "a" };
        String[] answer = sticksOut(xs);
        assertArrayEquals(xs,answer);
        assertEquals(1, xs.length);
        xs[0] = "b";
        assertFalse(xs[0].equals(answer[0]));
    }

    public static void main (String[] args)
    {
        org.junit.runner.JUnitCore.main("SticksOut");
    }

}
