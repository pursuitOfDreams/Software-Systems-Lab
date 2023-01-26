import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.*;

public class q3
{
    public boolean func1(String s)
    {
        boolean flag = false;
        for(int i=1;i<=5;i++)
        {
            flag = flag || Pattern.matches("[a-zA-Z0-9]{"+i+"}$", s);
        }
        return flag;
    }

    public boolean func2(String s)
    {
        return Pattern.matches("a*b+c", s);
    }

    public boolean func3(String s)
    {
        int length = s.length();
        if (length>=2){
            if(length%2==0)
                return Pattern.matches("[a]{"+length/2+"}[b]{"+length/2+"}+", s);
            else
                return false;
        }
        else{
            return false;
        }
        
    }

    public ArrayList<String> func4(String s1, String s2)
    {
        ArrayList<String> matches = new ArrayList<String>();
        String input = s1;
        Pattern pattern = Pattern.compile(s2);
        Matcher matcher = pattern.matcher(input);
        while (matcher.find()) 
        {
            String str = matcher.group();
            matches.add(str);
        }
        return matches;
    }
}
