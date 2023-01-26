import java.util.*;

public class Person
{
    private String name;
    private int age;
    public Person(String s, int n)
    {
        name=s;
        age=n;
    }
    public String getName()
    {
        return name;
    }
    public int getAge()
    {
        return age;
    }
    public void intro()
    {
        System.out.println("I am a person,"+name+","+age);
    }
}
