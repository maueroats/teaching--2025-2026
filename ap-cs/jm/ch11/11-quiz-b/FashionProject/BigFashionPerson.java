import java.util.*;

public class BigFashionPerson extends Person {
    private ArrayList<Clothes> ropa;
    public BigFashionPerson(String n, ArrayList<Clothes> wearing) {
        super(n);
        ropa = wearing;
    }
    public int getWarmth() {
        int w = 0;
        for (Clothes c : ropa) {
            w += c.warmth();
        }
        return w;
    }
    public int getFashion() {
        Clothes first = ropa.get(0);
        int fashion = first.fashion();

        for (Clothes c : ropa) {
            int cf = c.fashion();
            if (cf < fashion) {
                fashion = cf;
            }
        }
        return fashion;
    }
}
