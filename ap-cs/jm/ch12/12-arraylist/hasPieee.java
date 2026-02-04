public class hasPieee {

    public static boolean hasPieee(List<Integer> nums) {
        return false;
    }

    public static void testPieee() {
        List<Integer> t1 = Arrays.asList(3,14,5,6,7,8,9);
        testit(t1,true);
        
        List<Integer> t2 = Arrays.asList(1,2,3,14,5,6,7,8,9);
        testit(t2,true);

        List<Integer> t3 = Arrays.asList(10,11,12,3,14);
        testit(t3,true);

        List<Integer> t4 = Arrays.asList(9,8,7,6,5,4,3);
        testit(t4,false);

        List<Integer> t5 = Arrays.asList(1,2718,3,4,5,6);
        testit(t5,true);

        List<Integer> t6 = Arrays.asList(2718);
        testit(t6,true);

        List<Integer> t7 = Arrays.asList(5,6,7,2718);
        testit(t7,true);

        List<Integer> t8 = new ArrayList<>(); // empty list
        testit(t8,false);

        List<Integer> t9 = Arrays.asList(3,0,14,0,159);
        testit(t9,false);
    }

    public static void testit(List<Integer> t, boolean correct) {
        boolean ans = hasPieee(t);
        if (ans != correct) {
            System.out.println(t);
            System.out.println("hasPieee gave "+ans+" should be "+correct);
        }
    }
}
