public class Courting implements Strategy
{
    public Partner potential;
    
    public Courting (Partner r) {
        potential=r;
    }

    public void doIt(UrRobot r) {
        if (potential.isAvailable()) {
            r.putBeeper();
        }
    }
}
