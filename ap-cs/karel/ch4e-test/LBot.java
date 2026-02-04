import kareltherobot.*;

public class LBot extends UrRobot implements Partner
{
    private Partner spouse = null;

    public LBot (int r, int c, Direction d, int b) {
        super(r,c,d,b);
    }

    public void setSpouse(Partner r) {
        spouse = r ;
    }
    public Partner getSpouse() {
        return spouse;
    }
    public boolean isAvailable() {
        return spouse == null;
    }
}
