import java.util.*;
import java.io.*;

public class q2
{
    public static void main(String[] args) throws Exception
    {   
        PrintStream output=new PrintStream("output.txt");
        System.setOut(output);
        File file = new File(args[0]);
        Scanner sc = new Scanner(file);
        while (sc.hasNextLine())
        {
            HashMap<Character,Integer> map=new HashMap<Character,Integer>();
            for(int i=97;i<=122;i++)
            {
                map.put((char)i,0);
            }
            String line = sc.nextLine();
            for(int i=0;i<line.length();i++)
            {
                char ch = line.charAt(i);
                if(65<=ch && ch<=90)
                ch=Character.toLowerCase(ch);
                if(97<=ch && ch<=122)
                {
                    int c = map.get(ch);
                    map.put(ch,c+1);
                }
            }
            int max=map.get('a');
            for(int i=97;i<=122;i++)
            {
                if(map.get((char)i)>max)
                max=map.get((char)i);
            }
            boolean flag = false;
            for(int i=97;i<=122;i++)
            {
                if(map.get((char)i)==max)
                {
                    if(flag)
                    System.out.print(","+(char)i+"="+map.get((char)i));
                    else
                    System.out.print((char)i+"="+map.get((char)i));
                    flag=true;
                }
            }
            System.out.print("\n");
        }
        sc.close();
    }   
}
