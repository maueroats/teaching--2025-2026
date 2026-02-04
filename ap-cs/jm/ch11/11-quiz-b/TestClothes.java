import java.util.*;
public class TestClothes {
    public static void main(String[] args) {
        Clothes hat = new HeadCovering(20, 105);
        Clothes underArmor = new WoolClothes (hat);
        Clothes denim = new HeadCovering(95,40);// just messing around
        ArrayList<Clothes> w = new ArrayList<>();
        w.add(hat);
        w.add(underArmor);
        w.add(denim);

        Person p1 = new PlainPerson("Jane");
        aassert(50 == p1.getFashion());
        aassert(90 == p1.getWarmth());
        aassert("Jane".equals(p1.getName()));

        Person p2 = new BigFashionPerson("Sanjana", w);
        aassert("Sanjana".equals(p2.getName()));
        aassert(20+25+95 == p2.getWarmth());
        aassert(40 == p2.getFashion());
    }
    // on repl.it the assert() method does nothing
    public static void aassert(bool b)
    {
	if (b) {
	    System.out.println("OK");
	} else {
	    System.out.println("BAD");
	}
    }
}
