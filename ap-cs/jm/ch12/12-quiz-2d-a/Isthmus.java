
public class Isthmus {
    public static int oddIsthmus(int[][] nums)
    {
        return -1;
    }

    public static void main (String[] args)
    {
        int[][] t1 = { {0,0,0,0,0,0,0,0},
                       {5,5,5,5,5,0,0,0},
                       {0,0,0,5,0,0,5,0},
                       {0,0,0,5,5,5,5,0}};
        int correct1 = 2;
        int answer1 = oddIsthmus(t1);
        System.out.println("Test 1: got "+answer1+" should be "+correct1);

        int[][] t2 = {{4,4,4,4,4,4,3,3,3},
                      {0,0,0,0,1,1,1,1,0},
                      {0,1,1,1,1,0,0,1,1},
                      {0,0,0,0,1,1,1,1,0},
                      {0,2,2,2,0,0,0,0,0},
		      {0,0,0,0,0,1,2,3,4},
                      {0,0,0,0,0,0,0,0,0}};
        int correct2 = 4; // was 3 but i think that is wrong
        int answer2 = oddIsthmus(t2);
        System.out.println("Test 2: got "+answer2+" should be "+correct2);      

        int[][] t3 = {{0,0,0,0,0,0,0,0,0},
                      {0,0,0,0,0,1,1,1,0},
                      {0,0,1,1,1,0,0,0,0},
                      {0,0,0,0,3,3,3,0,0},
		      {0,1,2,3,0,0,0,0,0},
                      {0,0,0,0,0,0,0,0,0}};
        int correct3 = 3;
        int answer3 = oddIsthmus(t3);
        System.out.println("Test 3: got "+answer3+" should be "+correct3);      
    }
}
