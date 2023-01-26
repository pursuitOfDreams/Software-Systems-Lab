#!/bin/bash

awk '{max=NR}END{print max}' sample.txt > sampler.txt

file=sampler.txt
max=$(cat "$file") 
awk -v m=$max -F '<div class="field field-name-field-select-state field-type-list-text field-label-above"><div class="field-label">State Name:&nbsp;</div><div class="field-items"><div class="field-item even">|</div></div></div><div class="field field-name-field-total-confirmed-indians field-type-number-integer field-label-above"><div class="field-label">Total Confirmed:&nbsp;</div><div class="field-items"><div class="field-item even">|</div></div></div><div class="field field-name-field-cured field-type-number-integer field-label-above">' '
BEGIN{
    ORS="\r\n";
}
{
if(NR>404&&NR<549&&FNR==NR)
{
    cases[$2] = $3;
}
else if(FNR!=NR)
{
    if(FNR!=m)
    {
        name = substr($1, 1, length($1)-1);
    }
    else
    {
        name=$1;
    }
    num[FNR] = cases[name];
    names[FNR] = name;
    max = FNR;
}
}
END{
    for(i=1;i<=max;i++)
    {
        for(j=1;j<=max-i;j++)
        {
            if(num[j]>num[j+1])
            {
                temp=num[j];
                num[j]=num[j+1];
                num[j+1]=temp;
                temp=names[j];
                names[j]=names[j+1];
                names[j+1]=temp;
            }
        }
    }
    for(i=1;i<=max;i++)
    {
        print(names[i]" "num[i]);
    }
}' covid_status.html sample.txt > output.txt
rm sampler.txt
