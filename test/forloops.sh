#!/bin/bash

for i in 1 2 3 
do
    echo $i
done 

echo "---------------------"
for i in {1..5}
do
  echo $i
done

echo "---------------------"
for i in {1..10..2} # start..end..step-size
do
  echo $i
done
# for i in {1..20..3}
# do 
#  echo $i
# done 

echo "-------c-style--------------"
#c-stype
for (( i=0; i<5; i++ ))
do
  echo $i
done

echo "------ loop through array------"
arr=(apple banana mango)
for item in "${arr[@]}"
do
  echo $item
done




echo "---loop-through command output=here ls--------"
for file in $(ls)
do
  echo $file
done
# for file in *
# do
#   echo "$file"
# done
echo "-----------file cat---------"
# for line in $(cat read.sh)
for line in $(cat file.txt)
do
  echo $line
done

# echo "-------------loop-over-args----------"
# for arg in "$@"
# do
#   echo $arg
# done