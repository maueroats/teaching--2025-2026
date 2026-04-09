import java.io.*;
import java.util.*;

public class Solution {

    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        int nrows = s.nextInt();
        int ncols = s.nextInt();
        char[][]rawmap = new char[nrows][ncols];
        // Keep an ArrayList of Food locations
        // Keep a single variable for the store
        
        for(int r=0; r<nrows; r++) {
            String onerow = s.next();
            for(int c=0; c<ncols; c++) {
                char y = onerow.charAt(c);
                
                if(y=='-') {
                    // normal square
                } else if (y=='X') {
                    // somehow mark that you cannot go here
                } else if (y=='F') {
                    // add to food locations list
                } else if (y=='S') {
                    // set the store location
                } else { 
                    System.err.println("Something horrible happened");
                }
            }
        }
    }
}

// you are not required to use this
class Posn implements Comparable<Posn> {
    public int x, y;
    public Posn(int xx, int yy) { x=xx; y=yy; }
    public int compareTo(Posn other) {
        int ans = this.x - other.x;
        if (ans == 0) {
            ans = this.y - other.y;
        }
        return ans;
    }
    public String toString() {
        return "(" + x + "," + y + ")";
    }
}
