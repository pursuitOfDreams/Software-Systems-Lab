#!/bin/bash

num=${1}
awk -v N=$num -F "[-|:]" '{
if(FNR!=NR)
{
    {
        if($1==1)
        {
            for(i=2;i<=NF;i++)
            {
                spam_frequency[$i]=spam_frequency[$i]+1;
            }
        } 
        else 
        {
            for(i=2;i<=NF;i++)
            {
                ham_frequency[$i]=ham_frequency[$i]+1;
            }
        }
    }
}
else
{
    mapping[$2] = $1; 
    num=NR;
    spam_frequency[num-1]=0
    ham_frequency[num-1]=0
} 
}

END{
    for(i=1;i<=N;i++)
    {
        max=0;
        id=0;
        for(j=0;j<num;j++)
        {
            if(max<spam_frequency[j])
            {
                max=spam_frequency[j];
                id=j;
            }
            if(max==spam_frequency[j])
            {

                if(mapping[id]>=mapping[j])
                {
                    max=spam_frequency[j];
                    id=j;
                }
            }
        }
        print mapping[id] >> "spam.txt";
        spam_frequency[id]=0;

        max=0;
        id=0;
        for(j=0;j<=num;j++)
        {
            if(max<ham_frequency[j])
            {
                max=ham_frequency[j];
                id=j;
            }
            if(max==ham_frequency[j])
            {
                if(mapping[id]>=mapping[j])
                {
                    max=ham_frequency[j];
                    id=j;
                }
            }
        }
        print mapping[id] >> "ham.txt";
        ham_frequency[id]=0;
    }
}
' word_token_mapping.txt sample.txt
# awk -F "|" '{if($1==1){for(i=2;i<=NF;i++){if(spam_frequency[$i]=="")spam_frequency[$i]=1; else spam_frequency[$i]=spam_frequency[$i]+1;}} else {for(i=2;i<=NF;i++){if(ham_frequency[$i]=="")ham_frequency[$i]=1; else ham_frequency[$i]=ham_frequency[$i]+1;}}}' sample.txt
