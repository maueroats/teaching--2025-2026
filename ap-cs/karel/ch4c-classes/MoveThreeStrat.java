import kareltherobot.*;
public class MoveThreeStrat implements Strategy
{
    public void doIt(UrRobot r)
    {
        r.move();
        r.move();
        r.move();
    }
}
