import java.util.*;

public class Student extends Person
{
    private int rollno;
    private ArrayList<Teacher> teachers = new ArrayList<Teacher>();
    
    public Student(String s,int a,int r)
    {
        super(s,a);
        rollno=r;
    }
    public Student(Person p,int r)
    {
        super(p.getName(),p.getAge());
        rollno=r;
    }
    public int getrollno()
    {
        return rollno;
    }

    public void addTeacher(Teacher teachr)
    {
        teachers.add(teachr);
    }

    public ArrayList<Teacher> getTeachers()
    {
        return teachers;
    }

    public void intro()
    {
        System.out.println("I am a Student,"+ super.getName()+","+super.getAge()+","+rollno);
    }

}