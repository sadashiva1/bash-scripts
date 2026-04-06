#!/bin/bash
greet() {
  echo "Hello from function without params"
  local var="Local-variable-inside-function"
  echo $var
}

add() {
  sum=$(($1 + $2))
  echo "function with parameters.. Sum: $sum"
}
greet
add 5 3

print_all() {
  echo "All args: $@"
}
print_all 1 2 3

get_sum() {
  echo "Calculating..." >&2   # Goes to terminal/console (by default)
  echo "test message1 ..." >&2 # '>&2' to console 
  echo $(($1 + $2)) # returned as result goes to stdout → captured
}
result=$(get_sum 5 3) # $(...) → captures only stdout (FD 1), stderr (FD 2) is NOT captured
echo "test-text-123 ..... Result: $result"

for i in {1..10..2} # for loop (range with step)
do
  echo "i = $i"
done

arr=("apple" "banana" "mango")  # for loop (array)
for item in "${arr[@]}"
do
  echo "Item: $item"
done

for file in $(ls)  # for loop (command)
do
  echo "File: $file"
done

for line in $(cat file.txt)  # for loop (read file)
do
  echo "Line: $line"
done

num=10  # if = [ $num -gt 10 ] && echo "Greater"
if [[ -n "$num" && $num -gt 5 ]]; then
  echo "Greater"
fi
# -n = not empty 
#if-else = [ $num -gt 10 ] && echo "Greater" || echo "Smaller"
if [ "$num" -gt 10 ]; then
  echo "if-true Greater than 10"
else
  echo "else Less or equal to 10"
fi

if [ "$num" -gt 10 ]; then
  echo "Greater"
elif [ "$num" -eq 10 ]; then
  echo "elif Equal"
else
  echo "Smaller"
fi