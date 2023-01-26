public class Matrix
{
    private float[][] mat;
    private int height, breadth;
    public Matrix(int n, float v)
    {
        height=n;
        breadth=n;
        mat = new float[n][n];
        for(int i=0;i<height;i++)
        {
            for(int j=0;j<breadth;j++)
            mat[i][j]=v;
        }
    }
    public Matrix(int n, int m, float v)
    {
        height=n;
        breadth=m;
        mat = new float[n][m];
        for(int i=0;i<height;i++)
        {
            for(int j=0;j<breadth;j++)
            mat[i][j]=v;
        }
    }
    public Matrix(int n)
    {
        height=n;
        breadth=n;
        mat = new float[n][n];
        for(int i=0;i<height;i++)
        {
            for(int j=0;j<breadth;j++)
            mat[i][j]=0;
        }
    }
    public Matrix(int n, int m)
    {
        height=n;
        breadth=m;
        mat = new float[n][m];
        for(int i=0;i<height;i++)
        {
            for(int j=0;j<breadth;j++)
            mat[i][j]=0;
        }
    }

    public Matrix add(Matrix a)
    {
        if(height!=a.height||breadth!=a.breadth)
        {
            System.out.println("Matrices cannot be added");
            Matrix b = new Matrix(1,1);
            return b;
        }
        else
        {
            Matrix b = new Matrix(height,breadth);
            for(int i=0;i<height;i++)
            {
                for(int j=0;j<breadth;j++)
                b.mat[i][j]=mat[i][j]+a.mat[i][j];
            }
            return b;
        }
    }

    public Matrix matmul(Matrix a)
    {
        if(breadth!=a.height)
        {
            System.out.println("Matrices cannot be multiplied");
            Matrix b = new Matrix(1,1);
            return b;
        }
        else
        {
            Matrix b = new Matrix(height, a.breadth);
            for(int i=0;i<height;i++)
            {
                for(int j=0;j<a.breadth;j++)
                {
                    for(int k=0;k<breadth;k++)
                    b.mat[i][j] += mat[i][k]*a.mat[k][j];
                }
            }
            return b;
        }
    }

    public void scalarmul(int n)
    {
        for(int i=0;i<height;i++)
        {
            for(int j=0;j<breadth;j++)
            mat[i][j]=mat[i][j]*n;
        }
    }

    public int getrows()
    {
        return height;
    }

    public int getcols()
    {
        return breadth;
    }

    public float getelem(int i,int j)
    {
        if(i>=height || j>=breadth || i<0 || j<0)
        {
            System.out.println("Index out of bound");
            return -100;
        }
        else
        {
            return mat[i][j];
        }
    }

    public void setelem(int i,int j,float v)
    {
        if(i>=height || j>=breadth || i<0 || j<0)
        {
            System.out.println("Index out of bound");
        }
        else
        {
            mat[i][j]=v;
        }
    }

    public void printmatrix()
    {   
        for(int i=0;i<height;i++)
        {
            for(int j=0;j<breadth;j++)
            if (j==breadth-1){
                System.out.print(mat[i][j]+"\n");
            }
            else{
                System.out.print(mat[i][j]+" ");
            }
        }
    }
}
