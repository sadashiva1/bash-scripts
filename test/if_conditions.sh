#!/bin/bash
#shebang = composed of a sharp (#) and a bang (!)

# num=6
read -p "Enter a number: " num

if [[ -n "$num" && $num -gt 10 ]]; then
  echo "Greater"
fi
# -n = not empty

# if [ $num -gt 10 ]; then
#   echo "Greater than 10"
# fi

if [ $num -gt 10 ]; then
  echo "Greater"
else
  echo "Smaller or equal"
fi

if [ $num -gt 10 ]; then
  echo "Greater"
elif [ $num -eq 10 ]; then
  echo "Equal"
else
  echo "Smaller"
fi

#===================================================
#Using double brackets [[ ]] (recommended)
if [[ $num -gt 10 ]]; then
  echo "Greater"
fi

str="hello"

if [[ "$str" == "hello" ]]; then
  echo "Match"
fi

# File checks (very important)
if [ -f file.txt ]; then
  echo "File exists"
fi
# Common flags:
# -f → file exists
# -d → directory exists
# -e → exists (any type)
# -r → readable
# -w → writable
# -x → executable

# Negation
if [[ ! -f file.txt ]]; then
  echo "File not found"
fi

# Multiple conditions (AND / OR)
# AND
if [[ $num -gt 5 && $num -lt 15 ]]; then
  echo "Between 5 and 15"
fi
# OR
if [[ $num -lt 5 || $num -gt 15 ]]; then
  echo "Outside range"
fi

# One-line if (short form)
[ $num -gt 10 ] && echo "Greater"
# With else:
[ $num -gt 10 ] && echo "Greater" || echo "Smaller"

# 10. Command exit status check (VERY important in DevOps)
if systemctl status nginx > /dev/null 2>&1; then
  echo "Nginx running"
else
  echo "Nginx not running"
fi