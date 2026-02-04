import java.util.*;
import java.lang.*;
import java.io.*;

class ShoppingSetup
{
    public static ArrayList<String> makeShopItems()
    {
        ArrayList<String> shopItems = new ArrayList<String> ();
        shopItems.add("banana");
        shopItems.add("rice");
        shopItems.add("turkey");
        shopItems.add("banana");
        shopItems.add("black beans");
        return shopItems;
    }
    public static ArrayList<Integer> makeShopAmounts()
    {
        ArrayList<Integer> shopItems = new ArrayList<Integer> ();
        shopItems.add(4);
        shopItems.add(128);
        shopItems.add(2);
        shopItems.add(8);
        shopItems.add(5);
        return shopItems;
    }
 
    public static void main (String[] args) throws java.lang.Exception
    {
        ArrayList<String> shopItems = makeShopItems();
        ArrayList<Integer> shopAmounts =makeShopAmounts();
        System.out.println(shopItems);
        System.out.println(shopAmounts);
    }
}

 
