#!/bin/bash

# 1. Basic case
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

# 2. Multiple patterns (OR condition)
case $var in
  start|run|go)
    echo "Start command"
    ;;
  stop|end)
    echo "Stop command"
    ;;
esac

# 3. Pattern matching (wildcards)
case $file in
  *.txt)
    echo "Text file"
    ;;
  *.sh)
    echo "Shell script"
    ;;
  *)
    echo "Other file"
    ;;
esac

# 4. Character matching
case $char in
  [a-z])
    echo "Lowercase letter"
    ;;
  [A-Z])
    echo "Uppercase letter"
    ;;
  [0-9])
    echo "Digit"
    ;;
esac

# 5.Case-insensitive match (using shopt)
shopt -s nocasematch

case $var in
  yes)
    echo "Affirmative"
    ;;
  no)
    echo "Negative"
    ;;
esac

# 6.Using case with command output
case $(whoami) in
  root)
    echo "You are root"
    ;;
  *)
    echo "Normal user"
    ;;
esac

# 7. Fall-through behavior (Bash 4+)
# ;& → execute next block without re-check
case $var in
  1)
    echo "One"
    ;&
  2)
    echo "Two"
    ;;
esac
# ;;& → re-check next pattern
case $var in
  1)
    echo "Matched 1"
    ;;&
  [0-9])
    echo "It's a digit"
    ;;
esac

# 8. Using case for CLI arguments
case $1 in
  -start)
    echo "Starting service"
    ;;
  -stop)
    echo "Stopping service"
    ;;
  -restart)
    echo "Restarting service"
    ;;
  *)
    echo "Usage: $0 {-start|-stop|-restart}"
    ;;
esac

# 9. Nested case
case $env in
  prod)
    case $action in
      deploy) echo "Deploying to prod" ;;
      rollback) echo "Rollback prod" ;;
    esac
    ;;
esac

# 10. Regex-like grouping (extended patterns)
shopt -s extglob
case $var in
  +(yes|y))
    echo "Yes"
    ;;
  +(no|n))
    echo "No"
    ;;
esac