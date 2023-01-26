#!/bin/bash


sed -e 's/[^A-Za-z ]//g' -e 's/^\w\{1,2\}\b //g' -e 's/ \b\w\{1,2\}$//g' -e 's/\b\w\{1,2\}\b//g' -e 's/^https[A-Za-z]*//g' -e 's/^http[A-Za-z]*//g' -e 's/^www[A-Za-z]*//g' -e 's/ https[A-Za-z]*//g' -e 's/ http[A-Za-z]*//g' -e 's/ www[A-Za-z]*//g' -e 's/\(.*\)/\L\1/' -e '/^[[:space:]]*$/d' -e 's/  */ /g' sample.txt > output.txt
# sed  's/gr[ae]y/blue/g' Sample3.txt > hello.txt
# sed -e 's/[^A-Za-z ]//g' -e 's/[A-Za-z]{2}//g' -e 's/[https http www][A-Za-z]*//g' -e 's/\(.*\)/\L\1/' Sample2.txt > hello.txt-e "s| $word | |g"

cat stopwords.txt > stopwords2.txt
printf "\nuwfagvyiwefgvi" >> stopwords2.txt
while read line;
do
    word="${line}"
    sed -e "s| $word | |g" -e "s| $word$||g" -e "s|^$word ||g" -e "s|^$word$||g" output.txt > hello2.txt
    rm output.txt
    cat hello2.txt > output.txt
done < stopwords2.txt
rm stopwords2.txt

sed -e '/^[[:space:]]*$/d' output.txt > hello2.txt
rm output.txt
cat hello2.txt > output.txt

cat suffixes.txt > suffixes2.txt
printf "\nuwfagvyiwefgvi" >> suffixes2.txt
while read line;
do
    word="${line}"
    sed -e "s|$word |______ |g" -e "s|$word$|______|g" output.txt > hello2.txt
    rm output.txt
    cat hello2.txt > output.txt
done < suffixes2.txt
rm suffixes2.txt

sed -e "s|______ | |g" -e "s|______$||g" output.txt > hello2.txt
rm output.txt
cat hello2.txt > output.txt
rm hello2.txt
