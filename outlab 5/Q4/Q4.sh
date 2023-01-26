#!/bin/bash

awk '
BEGIN{
    FS="[\t]";
    OFS=" ";
}
{
    print $1;
}
' $1 > names.txt

t1=${2}
t2=${3}

awk -v start=$t1 -v end=$t2 '
BEGIN{
    HR1 = int(substr(start,1,2));
    M1 = int(substr(start,4,2));
    S1 = int(substr(start,7,2));
    HR2 = int(substr(end,1,2));
    M2 = int(substr(end,4,2));
    S2 = int(substr(end,7,2));
    t1 = 3600*HR1+60*M1+S1;
    t2 = 3600*HR2+60*M2+S2;
    OFS="\t";
}

{
    if (FNR==NR){
        if(NR!=1)
        {
            if($(NF-2)=="Joined")
            {
                time=$NF
                HR = int(substr(time,1,2));
                M = int(substr(time,4,2));
                S = int(substr(time,7,2));
                t = 3600*HR+60*M+S;
                if(t<t1)
                t=t1;
                current_joined[$1] = t;
                joined_status[$1] = 1;
            }
            else
            {
                time=$NF
                HR = int(substr(time,1,2));
                M = int(substr(time,4,2));
                S = int(substr(time,7,2));
                t = 3600*HR+60*M+S;
                if(t>t2)
                t=t2;
                times[$1] = int(times[$1]) + t - current_joined[$1];
                joined_status[$1] = 0;
            }
        }
    }
    else{
        if (FNR>1){
            if (names[$1]==""){
                names[$1]=$0;
            }
        }
    }

}
END{
    N=0;
    for(key in joined_status)
    {   
        N=N+1;
        if(joined_status[key]==1)
        times[key] = int(times[key]) + t2 - current_joined[key];
    }

    for(j=0;j<N;++j){
        min_name="";
        for(key in joined_status){
            if (names_printed[key]==names[key]){
                continue;
            }
            if (min_name==""){
                if (names_printed[key]==""){
                    min_name=key;
                }
            }
            if (names[min_name]>names[key]){
                min_name=key;
            }
        }
    
        H0=int(times[min_name]/3600);
        M0=int((times[min_name]-3600*H0)/60);
        S0=times[min_name]-3600*H0-60*M0;
        if(H0<10)
        {
            if(M0<10)
            {
                if(S0<10)
                print names[min_name],"0"H0":0"M0":0"S0;
                else
                print names[min_name],"0"H0":0"M0":"S0;
            }
            else
            {
                if(S0<10)
                print names[min_name],"0"H0":"M0":0"S0;
                else
                print names[min_name],"0"H0":"M0":"S0;
            }
        }
        else
        {
            if(M0<10)
            {
                if(S0<10)
                print names[min_name],H0":0"M0":0"S0;
                else
                print names[min_name],H0":0"M0":"S0;
            }
            else
            {
                if(S0<10)
                print names[min_name],H0":"M0":0"S0;
                else
                print names[min_name],H0":"M0":"S0;
            }
        }
        names_printed[min_name]=names[min_name];
    }
        
    
}
' $1 names.txt >output.txt

rm names.txt
