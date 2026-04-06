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
  echo "Calculating..." >&2   # Goes to terminal/console (by default)
  echo "test message1 ..." >&2 # Goes to terminal/console (by default)
  echo "test message2 ..." >&2 # Goes to terminal/console (by default)
  echo "test message3 ..." >&2 # Goes to terminal/console (by default)
  echo $(($1 + $2)) # returned as result goes to stdout → captured
}
result=$(get_sum 5 3) # $(...) → captures only stdout (FD 1), stderr (FD 2) is NOT captured
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
# FD = File Descriptor
# 0 → stdin (input)
# 1 → stdout (output)
# 2 → stderr (error)

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
# custom FDs ==== FD = File Descriptor
# Created FD 3 → success.log
# Created FD 4 → error.log
# Anything >2 is user-defined (custom)
exec 3> success.log  # echo "Success message" >&3
exec 4> error.log  # echo "Error message" >&4
echo "Success message" >&3
echo "Error message" >&4

# 4. Save and restore stdout (advanced)
exec 3>&1   # save stdout - FD 3 now points to stdout (terminal), NOT the file anymore -Nothing is written to success.log
echo "Normal output"
# Create FD 3 as a copy of stdout (FD 1) -“backup of terminal output”
# echo "Normal output" - Goes to stdout (terminal)

exec 1> file.txt   # redirect stdout to file
#now all normal output goes to file
echo "This goes to file"

exec 1>&3   # Restore stdout from FD 3 (backup)
echo "Back to terminal"


# tee -a = print + append to file
echo "Hello" | tee -a success.log #takes input (from pipe '|') => Writes to both stdout(console) and file
# -a flag = append mode
# Without -a overwrites file every time
echo "Hello" | tee success.log
# With -a keeps adding (safe for logs)
echo "Hello" | tee -a success.log
# tee = split output into two places
echo "Hello" | tee file.txt
# Prints 'Hello' on screen And Saves 'Hello' in file.txt


# some Important
# Arguments
#     $@ → all args (separately, best practice)
#     $* → all args (as one string)
#     $# → number of args

# Exit / status
#     $? → exit code of last command
#     $$ → current script PID
#     $! → PID of last background process

# Script info
#     $0 → script name
#     $1, $2 ... → positional args

# Last values
#     $_ → last argument of previous command
# echo hello world
# echo $_ output:world

# Example
echo $0   # script name
echo $1   # first arg
echo $#   # count
# count of positional arguments passed to script/function
# script.sh a b c  Output:3
echo $?   # last status