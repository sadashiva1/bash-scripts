#!/bin/bash
num=6 
if [[ -n "$num" && $num -gt 10 ]]; then
  echo "if-true Greater than 10"
# fi
else
  echo "else Less or equal to 10"
fi
# if =>> [ $num -gt 10 ] && echo "Greater"
#if-else =>> [ $num -gt 10 ] && echo "Greater" || echo "Smaller"

if [ "$num" -gt 10 ]; then
  echo "Greater"
elif [ "$num" -eq 10 ]; then
  echo "elif Equal"
else
  echo "Smaller"
fi
#=======================================
count=1
while [[ $count -le 5 ]]
do
  echo $count
  ((count++))
done

count=1
while true
do
  if [[ $count -gt 3 ]]; then
    break
  fi
  echo $count
  ((count++))
done

while read line
do
  echo "$line"
done < file.txt