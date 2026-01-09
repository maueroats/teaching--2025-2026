import kareltherobot.*;

public class BetterBot extends UrRobot
{
    public BetterBot (int r, int c, Direction d, int beep)
    {
        super(r,c,d,beep);
    }

    public void turnRight()
    {
        turnLeft();
        turnLeft();
        turnLeft();
    }

    // more stuff?
}
