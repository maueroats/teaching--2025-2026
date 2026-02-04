
public class HeadCovering implements Clothes {
    private int fashion, warmth;
    public HeadCovering (int fash, int warm) {
        fashion = fash;
        warmth = warm;
    }
    public int fashion() {
        return this.fashion;
    }
    public int warmth() {
        return this.warmth;
    }
}
