import java.util.*;

public class LinkedListDemo {
    public static void main (String[] args)
    {
        LinkedList<String> demo = new LinkedList<String>();

        demo.add("a");
        demo.add("c");
        demo.add(1,"baa");
        demo.addFirst("Line Jumper");
        demo.addLast("Line Ender");

        System.out.println(demo.getFirst());
        System.out.println(demo.getLast());
        System.out.println(demo);

        // poll gets and removes an item
        String x = demo.pollFirst();
        System.out.println(demo);       
    }
}
