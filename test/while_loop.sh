#!/bin/bash

# 1. Basic while loop
count=1
while [ $count -le 5 ]
do
  echo $count
  ((count++))
done

# 2. Using [[ ]] (recommended)
count=1
while [[ $count -le 5 ]]
do
  echo $count
  ((count++))
done

# 3. Infinite loop
while true
do
  echo "Running..."
  sleep 2
done

# 👉 stop with Ctrl + C
# 4. While loop with break
count=1
while true
do
  if [[ $count -gt 3 ]]; then
    break
  fi
  echo $count
  ((count++))
done

# 5. While loop with continue
count=0
while [[ $count -lt 5 ]]
do
  ((count++))
    if [[ $count -eq 3 ]]; then
      continue
    fi
  echo $count
done

# 6. Read file line by line (VERY important)
while read line
do
  echo "$line"
done < file.txt

# 👉 safer version:

while IFS= read -r line
do
  echo "$line"
done < file.txt

# 7. While loop with command (DevOps style)
while ! kubectl get pods > /dev/null 2>&1
do
  echo "Waiting for cluster..."
  sleep 5
done

# 👉 keeps retrying until command succeeds
# 8. Reading user input continuously
while true
do
  read -p "Enter value (q to quit): " input
    if [[ "$input" == "q" ]]; then
      break
    fi
  echo "You entered: $input"
done

# 9. Until loop (reverse of while)
# until loop runs until condition becomes TRUE -OR- Loop runs while this is FALSE
count=1
until [[ $count -gt 5 ]]
do
  echo $count
  ((count++))
done

while ! kubectl get pods > /dev/null 2>&1
do
  echo "Waiting..."
done
# command > /dev/null --> nothing prints on screen(don’t spam terminal with output)
# /dev/null --> Special file in Linux: “Black hole” — anything sent here is discarded
#2>&1 --> “2 goes to &1” stderr → stdout → /dev/null
# command > /dev/null 2>&1   # ✅ correct
# command 2>&1 > /dev/null   # ❌ different behavior
# > /dev/null      # hide stdout
# 2> /dev/null     # hide stderr
# &> /dev/null     # hide both (bash shortcut)