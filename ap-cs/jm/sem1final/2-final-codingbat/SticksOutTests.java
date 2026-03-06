import org.junit.*;
import org.junit.runner.*;
import static org.junit.Assert.*;

// Extended tester class, not shared during exam.
public class SticksOutTests {
    @Test
    public void test_trivial() {
        String[] xs = { };
        String[] answer = SticksOut.sticksOut(xs);
        assertArrayEquals(xs,answer);
        assertEquals(0, xs.length);
    }
    @Test
    public void test_unshared_result() {
        String[] xs = { "a" };
        String[] answer = SticksOut.sticksOut(xs);
        assertArrayEquals(xs,answer);
        assertEquals(1, xs.length);
        xs[0] = "b";
        assertFalse(xs[0].equals(answer[0]));
    }
    public void test_it(String[] correct, String[] input) {
        String[] result = SticksOut.sticksOut(input);
        assertArrayEquals(correct,result);
    }
    @Test
    public void test_given_1() {
        String[] input = 
            {"alfa","bravo","zulu","charlie"};
        String[] correct = 
            {"alfa","bravo","lie","charlie"};
        test_it(correct, input);
    }
    @Test
    public void test_given_2() {
        String[] input = 
            {"walnut","pie","quince"};
        String[] correct =
            {"walnut", "nce", "quince"};
        test_it(correct,input);
    }
    @Test
    public void test_given_3() {
        String[] input = 
            {"DELTA","eragon","FOXTROT","FOXTRO"};
        String[] correct =
            {"DELTA","eragon","TRO","FOXTRO"};
        test_it(correct,input);
    }
    @Test
    public void test_spam() {
        String[] input = 
            {"a","a","a","a","a","a","a","a","a","a","a","a","b","a","a","a"};
        String[] correct =
            {"a","a","a","a","a","a","a","a","a","a","a","a","","a","a","a"};
        test_it(correct,input);
    }
    @Test
    public void test_spam_end() {
        String[] input = 
            {"z","z","z","z","z","z","z","z","z","z","z","z","z","z","aa"};
        String[] correct =
            {"z","z","z","z","z","z","z","z","z","z","z","z","z","a","aa"};
        test_it(correct,input);
    }
    @Test
    public void test_integer_div() {
        String[] input =
            {"cc","","123456"};
        String[] correct =
            {"cc","456","123456"};
        test_it(correct,input);
    }

    public static void main (String[] args)
    {
        org.junit.runner.JUnitCore.main("SticksOutTests");
    }

}
