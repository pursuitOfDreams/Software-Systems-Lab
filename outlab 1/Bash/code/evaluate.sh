#!/bin/bash

touch marksheet.csv
declare -i n=0
declare -a allscores
cd organised
for d in */;
do
    cd $d
    roll="${d::-1}"
    declare -i score=0
    output=$(g++ *.cpp -o executable 2>/dev/null)
    if [[ $? != 0 ]]; then
        # There was an error
        :
    else
        # Compilation successfull
        mkdir student_outputs
        g++ *.cpp -o executable
        cd ..
        cd ..
        cd mock_grading
        cd inputs
        for file in ./*.in
        do
            filename=${file::-3}
            filename=${filename:2}
            cd ..
            cd ..
            cd organised
            cd $roll
            timeout 5 ./executable < "../../mock_grading/inputs/$filename.in" > "student_outputs/$filename.out" 2>/dev/null |:
        done
        if [ -z "$(ls -A student_outputs)" ]; 
        then
            :
        else
            cd student_outputs
            for qfile in ./*.out
            do 
                qfilename=${qfile:2}
                cmp -s $qfilename ../../../mock_grading/outputs/$qfilename && score+=1
            done
            cd ..
        fi
    fi
    cd ..
    cd ..
    echo $roll,$score >> marksheet.csv
    allscores[$n]=$score
    n+=1
    cd organised
done
cd ..
# printf '%s\n' "${array[@]}" | sort -n > distribution.txt
n+=-1
for i in $(seq 0 $(($n-1)))
do
    for j in $(seq $(($i+1)) $n)
    do
        if [ ${allscores[$i]} -lt ${allscores[$j]} ]; 
        then
            t=${allscores[$i]}
            allscores[$i]=${allscores[$j]}
            allscores[$j]=$t
        fi
    done
done
touch distribution.txt
for i in $(seq 0 $n)
do
    echo ${allscores[$i]} >> distribution.txt
done