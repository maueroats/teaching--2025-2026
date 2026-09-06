import java.io.*;
import java.util.*;
/**
 * The `ReadMatrix` class 
 * 
 * Use it by doing `ReadMatrix.readFile(new File("data1.txt"))`
 */
public class ReadMatrix
{
    // instance variables - replace the example below with your own
    public int[][] data;

    /**
     *
     * @param  n  The size of the square (nxn)
     * @return    The matrix of data from the scanner, read in row major order.
     */
    public static int[][] readData(Scanner sc, int n)
    {
        int[][] data = new int[n][n];
        int rows = n;
        int cols = n;
        for (int r=0; r<rows; r++) {
            for(int c=0; c<cols; c++) {
                data[r][c] = sc.nextInt();
            }
        }
        return data;
    }
    
    public static int[][] readFile(File f) throws FileNotFoundException
    {
        Scanner s = new Scanner(f);
        int n = s.nextInt();
        return readData(s,n);
    }
}
