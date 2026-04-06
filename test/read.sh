#!/bin/bash
echo "Om namaha shivay "

# read -p "Enter a number: " num
# echo "$num"

# echo "Enter a number:"
# read num1
# echo "num1: ${num1}"
# echo "------------"
# printf "Enter a number: "
# read num2
# echo "num2:$num2"

# read -t 5 -p "Enter a number (within 5 sec): " num

# read -s -p "Enter password: " pass
# echo

# read -p "Enter two numbers: " num1 num2
# echo "Num1: $num1, Num2: $num2"

read -p "Enter a number (default 10): " num
num=${num:-10}
echo "Value is $num"

# Read from command-line argument instead (very common in real scripts)
# num=$1
# echo "Number is: $num"
# ./read.sh x
