#!/bin/bash

# IFS[ Internal Field Separator]
# IFS: controls how Bash splits words during reading and expansion.
# #1. Default IFS
# echo "$IFS"
# Default is:     space " "
#                 tab "\t"
#                 newline "\n"
# # Used when:
# for x in $var   # splits on space/tab/newline

#2. Change IFS temporarily (inline) - Splits on comma instead of space
IFS=',' read a b c <<< "one,two,three"
echo $a $b $c

# #3. Change IFS globally (be careful)
# IFS=:
# for x in $PATH
# do
#   echo $x
# done
# Splits $PATH by :
# Always reset:
# IFS=$' \t\n'

#4. Using IFS with read (most important use-case)
echo "name:age:city" | while IFS=: read name age city
do
  echo "$name - $age - $city"
done
#Clean parsing of structured data

# 5. IFS for CSV parsing
while IFS=',' read col1 col2 col3
do
  echo "$col1 | $col2 | $col3"
done < file.csv

#6. Preserve spaces (important trick)
IFS= read -r line
# ✔ Prevents:
# trimming spaces
# backslash escaping
# 👉 This is best practice for reading lines

# 7. IFS empty (no splitting) - Treats entire string as one field
IFS=
for x in $var
do
  echo "$x"
done

# 8. Split into array
IFS=',' read -ra arr <<< "a,b,c"
echo "${arr[0]}"

# 9. Using IFS in command substitution
IFS=',' 
set -- $var
echo $1 $2 $3

#10. Custom delimiter (multi-char workaround)
# IFS only supports single characters, but workaround:
echo "a||b||c" | tr '||' '\n'
# or:
awk -F '||' '{print $1}'

#11. Loop through lines safely (gold standard)
while IFS= read -r line
do
  echo "$line"
done < file.txt
# Handles:
#     spaces
#     special chars
#     no data loss

#12. Leading/trailing whitespace behavior
IFS=',' read a b <<< "  x,  y"
#trims spaces unless:
IFS= read -r line   # preserves exactly

# Default = space, tab, newline
# IFS= read -r → safest pattern
# Changing global IFS can break scripts

# Real DevOps Example Parsing pod output:
kubectl get pods -o wide | while IFS=' ' read name ready status rest
do
  echo "$name -> $status"
done
