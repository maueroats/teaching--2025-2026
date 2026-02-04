
public class WoolClothes implements Clothes {
    public Clothes x;
    public WoolClothes(Clothes tx) {
        x = tx;
    }
    public int warmth() {
        return 5 + x.warmth();
    }
}
