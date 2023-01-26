public class q1
{
    public static void main(String[] args)
    {
        int N = args.length;
        float sum = 0;
        float product = 1;
        for(int i=0;i<args.length;i++)  
        {
            sum += Integer.parseInt(args[i]);
            product*=Integer.parseInt(args[i]);
        }
        System.out.print(N+","+sum+","+product);
    }   
}
