#!/bin/bash

# Function definition
greet_user() {
    echo "Hello, $1! Welcome to the script."
    echo -e "\n"
}

# Call function
greet_user "Sada"

echo "---------------------------"

# FOR LOOP example
echo "For loop example:"
for i in 1 2 3 4 5
do
    echo "Number: $i"
done

echo "---------------------------"

# WHILE LOOP example
echo "While loop example:"
count=1
while [ $count -le 3 ]
do
    echo "Count is: $count"
    ((count++))
done

echo "---------------------------"

# IF-ELIF-ELSE example
read -p "Enter a number: " num

if [ $num -gt 10 ]; then
    echo "Number is greater than 10"
elif [ $num -eq 10 ]; then
    echo "Number is exactly 10"
else
    echo "Number is less than 10"
fi

echo "---------------------------"

# Function with loop and condition
check_even_odd() {
    for n in "$@"
    do
        if (( n % 2 == 0 )); then
            echo "$n is Even"
        else
            echo "$n is Odd"
        fi
    done
}

echo "Even/Odd check:"
check_even_odd 1 2 3 4 5