import java.util.*;

public class Teacher extends Person
{
    private int salary;
    private ArrayList<Student> students = new ArrayList<Student>();
    public Teacher(String s, int a, int b)
    {
        super(s,a);
        salary=b;
    }

    public Teacher(String s, int a)
    {
        super(s,a);
        salary=10000;
    }

    public Teacher(Person s, int b)
    {
        super(s.getName(),s.getAge());
        salary=b;
    }

    public int getSalary()
    {
        return salary;
    }

    public void addStudent(Student stud)
    {
        students.add(stud);
    }

    public ArrayList<Student> getStudents()
    {
        return students;
    }

    public void intro()
    {
        System.out.println("I am a Teacher,"+ super.getName()+","+super.getAge()+","+salary);
    }
}