#!/bin/bash

awk '{
ORS="";
if(NR==1)
{
    num=$1
}
else
{
    if(NR%3==1)
    {
        for(i=1;i<=NF;i++)
        {
            digit = $i;
            if(i==NF)
            digit = substr(digit,1,1);
            if(digit=="A")
            x = 10;
            else if(digit=="B")
            x = 11;
            else if(digit=="C")
            x = 12;
            else if(digit=="D")
            x = 13;
            else if(digit=="E")
            x = 14;
            else if(digit=="F")
            x = 15;
            else
            x = digit;
            input2=input2*base_input+x;
        }
        output = input1+input2;base
        output2="";
        while(output!=0)
        {
            digit = output - base_output*int(output/base_output);
            if(digit==10)
            x = "A"
            else if(digit==11)
            x = "B";
            else if(digit==12)
            x = "C";
            else if(digit==13)
            x = "D";
            else if(digit==14)
            x = "E";
            else if(digit==15)
            x = "F";
            else
            x = digit;
            output = int(output/base_output);
            output2= x output2;
        }
        while(output2!="")
        {
            print(substr(output2,1,1));
            output2 = substr(output2,2);
            if (output2==""){
                continue;
            }
            print(" ");
           
        }
        print("\n");
        input1 = 0;
        input2 = 0;
        output = 0;
    }
    else if(NR%3==2)
    {
        base_input = $1;
        base_output = $2;
    }
    else
    {
        for(i=1;i<=NF;i++)
        {
            digit = $i;
            if(i==NF)
            digit = substr(digit,1,1);
            if(digit=="A")
            x = 10;
            else if(digit=="B")
            x = 11;
            else if(digit=="C")
            x = 12;
            else if(digit=="D")
            x = 13;
            else if(digit=="E")
            x = 14;
            else if(digit=="F")
            x = 15;
            else
            x = digit;
            input1=input1*base_input+x;
        }
    }
}
}
' bonus_sample_input.txt > bonus_output.txt
