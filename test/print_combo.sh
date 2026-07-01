#!/bin/bash
#shebang = composed of a sharp (#) and a bang (!)
read -p "Enter a number: " num
read -p "Enter a number (default 10): " num
#read -s -p "Enter password: " pass

finction_print_all() {
    echo "All args: $@"
    #sum=$(($1 + $2)) --then-- finction_print_all 5 3    
    #echo "Calculating..." >&2 --then-- finction_print_all=$(get_sum 5 3)
    #echo "Calculating..." >&2
    #exec 3> success.log  # echo "Success message" >&3
    #exec 4> error.log  # echo "Error message" >&4
}
finction_print_all 1 2 3

#for i in $(cat file.txt) 
#for i in $(ls)  # for loop with command
#for i in 1 2 3 
#for i in {1..5}
#for (( i=0; i<5; i++ ))
for i in {1..10..2} # for loop (range with step)
do
  echo "i = $i"
done

arr=("apple" "banana" "mango")  # for loop (array)
for item in "${arr[@]}"
do
  echo "Item: $item"
done
#if [[ -n "$num" && $num -gt 10 ]]; then  -- better[[]]
if [ "$num" -gt 10 ]; then
  echo "Greater"

elif [ "$num" -eq 10 ]; then
  echo "elif Equal"
else
  echo "Smaller"
fi
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
case $var in
  start)
    echo "Starting"
    ;;
  stop)
    echo "Stopping"
    ;;
  *)
    echo "Unknown option"
    ;;
esac