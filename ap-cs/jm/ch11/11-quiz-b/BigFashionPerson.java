
public class BigFashionPerson extends Person {
    private ArrayList<Clothes> ropa;
    public BigFashionPerson(String n, ArrayList<Clothes> wearing) {
        super(n);
        ropa = wearing;
    }
    public int getWarmth() {
        int w = 0;
        for (Clothes c : ropa) {
            w += c.getWarmth();
        }
        return w;
    }
    public int getFashion() {
        Clothes first = ropa.get(0);
        int fashion = first.getFashion();

        for (Clothes c : ropa) {
            int cf = c.getFashion();
            if (cf < fashion) {
                fashion = cf;
            }
        }
        return cf;
    }
}
