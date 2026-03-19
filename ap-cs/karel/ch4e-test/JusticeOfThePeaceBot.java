
public class JusticeOfThePeaceBot extends UrRobot
{
    public JusticeOfThePeaceBot (int r, int c, Direction d, int b)
    {
        super(r,c,d,b);
    }

    public boolean marry(Partner a, Partner b)
    {
        if (! a.isAvailable() || ! b.isAvailable() ) {
            return false;
        }

        a.setSpouse(b);
        b.setSpouse(a);
    }
}
