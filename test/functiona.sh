#!/bin/bash

greet() {
  echo "Hello, welcome! without parameters"
}
greet

greet() {
  echo "Hello, $1"
}
greet "Sada"

add() {
  sum=$(($1 + $2))
  echo "Sum: $sum"
}
add 5 10

print_all() {
  echo "All args: $@"
}

print_all 1 2 3

#-----------------------------------------------------------------------
check_even() {
  if (( $1 % 2 == 0 )); then
    return 0   # success
  else
    return 1   # failure
  fi
}
check_even 4
if [ $? -eq 0 ]; then #---- $? imp result of last cmd
  echo "Even"
else
  echo "Odd"
fi
# 0 = success (true)
# non-zero = failure (false)
#--------------------------------------------------------------------------

#-------------------------------------------------------------------------
#Return actual value using echo (MOST COMMON)
get_sum() {
  echo $(($1 + $2))
}
result=$(get_sum 3 7)
echo "Result: $result"

# get_sum() {
#   echo "Calculating..."
#   echo $(($1 + $2))
# }
# result=$(get_sum 5 3)
# echo "Result: $result"
#     Output:
#     Result: Calculating...
#     8
get_sum() {
  echo "Calculating..." >&2   # imp >&2 -----------------
  echo $(($1 + $2))
}

result=$(get_sum 5 3)
echo "abcdefghi ..... Result: $result"

# >&2 means:
# “send output to stderr (file descriptor 2) instead of stdout”
# 0 → STDIN (input)
# 1 → STDOUT (normal output)
# 2 → STDERR (error output)
#-----------------------------------------------

# Local variables inside function
demo() {
  local var="inside"
  echo $var
}
demo

# Interview cheat code
# $1, $2 → parameters
# $@ → all args
# $? → last command status
# return → status only
# echo → actual value return



#=====================================================================
echo "======================================"
# Correct usage (define FD 3)
# 1. Redirect FD 3 to a file
exec 3> output.log
echo "This goes to FD3" >&3
# output goes into output.log

# 2. Use FD 3 for logging
exec 3> debug.log
log() {
  echo "$1" >&3
}
log "Debug message"

# 3. Separate outputs (VERY POWERFUL)
exec 3> success.log
exec 4> error.log
echo "Success message" >&3
echo "Error message" >&4

# 4. Save and restore stdout (advanced)
exec 3>&1   # save stdout
echo "Normal output"
exec 1> file.txt   # redirect stdout to file
echo "This goes to file"
exec 1>&3   # restore stdout
echo "Back to terminal"