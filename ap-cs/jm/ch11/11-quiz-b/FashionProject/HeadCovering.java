
public class HeadCovering implements Clothes {
    private int fashion, warmth;
    public HeadCovering (int warm, int fash) {
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
