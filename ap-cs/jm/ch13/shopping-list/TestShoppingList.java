import java.util.*;
import org.junit.*;
import org.junit.runner.*;
import static org.junit.Assert.*;

public class TestShoppingList {
  @Test
  public void test1() {
    ArrayList<String> items = new ArrayList<>(Arrays.asList("banana","oreo","pie"));
    ArrayList<Integer> prices = new ArrayList<>(Arrays.asList(5,10,7));
   
    // just for demo on how to create answers not for you to copy
    List<String> correct_items = Arrays.asList("oreo");
    List<Integer> correct_prices = Arrays.asList(10);
    
    ShoppingList.listEditor(items,prices,"banana", 8);
    
    assertEquals(correct_items,items);
    assertEquals(correct_prices,prices);
  }
}