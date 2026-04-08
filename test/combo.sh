#!/bin/bash
#shebang = composed of a sharp (#) and a bang (!)
greet() {
  echo "Hello from function without params"
  local var="Local-variable-inside-function"
  echo $var
}
#--------------------------------------------------
add() {
  sum=$(($1 + $2))
  echo "function with parameters.. Sum: $sum"
}
greet
add 5 3P
#--------------------------------------------------
print_all() {
  echo "All args: $@"
}
print_all 1 2 3
#--------------------------------------------------
get_sum() {
  echo "Calculating..." >&2   # Goes to terminal/console (by default)
  echo "test message1 ..." >&2 # '>&2' to console 
  echo $(($1 + $2)) # returned as result goes to stdout → captured
}
result=$(get_sum 5 3) 
# $(...) → captures only stdout (FD 1), stderr (FD 2) is NOT captured
echo "test-text-123 ..... Result: $result"
#========================================================
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

read -p "Enter a number: " num
read -p "Enter a number (default 10): " num




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