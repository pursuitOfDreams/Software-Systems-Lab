#!/bin/bash

# awk 'BEGIN{adjuster=0}{ ORS=" " }{mynum[1]=0}{print"0"}{for(i=1;i<=NF;i++){for(j=1;j<i;j++) if($i==$j) {print(mynum[j]); mynum[i]=mynum[j]; break;} else if(j==i-1) {num=num+1; mynum[i]=num; print(mynum[i])}}}{printf"\n"}{adjuster=num}' sample.txt > output.txt
# awk '{ORS=" "}{print NF}' sample.txt > output.txt

awk '
BEGIN{
    num=-1;
    ORS=""
}
{
    for(i=1;i<=NF;i++){
        if(my_dict[$i]==""){
            num=num+1;
            my_dict[$i]=num;
            print(num);
            if (i==NF){
                continue;
            }
            print(" ");
        }
        else{
            print(my_dict[$i]);
            if (i==NF){
                continue;
            }
            print(" ");
        }
    }
}
{printf "\n"}' sample.txt > output.txt
