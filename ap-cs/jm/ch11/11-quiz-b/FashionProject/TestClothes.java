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
        assert(50 == p1.getFashion());
        assert(90 == p1.getWarmth());
        assert("Jane".equals(p1.getName()));

        Person p2 = new BigFashionPerson("Sanjana", w);
        assert("Sanjana".equals(p2.getName()));
        assert(20+25+95 == p2.getWarmth());
        assert(40 == p2.getFashion());
    }
}
