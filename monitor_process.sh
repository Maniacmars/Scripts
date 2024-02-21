#!/bin/bash
#Useful script for monitoring processes based on a certain grep pattern and a variable that can be adjusted as needed.
#Processes will be displayed for a selected duration (use sleep function) with different colors for easier identification.

execute_command() {
  variable=$1
  grep_pattern=$2
  color=$3
  echo -e "\033[0;${color}m"
  ps aux | grep "$grep_pattern"
  echo -e "\033[0m"
}

while true; do
  for variable in "${variables[@]}"; do
    for grep_pattern in "DONE" "IN PROGRESS" "FAILED"; do
      clear
      case $grep_pattern in
        DONE) color=32;;
        IN PROGRESS) color=33;;
        FAILED) color=31;;
        *) color=0;;
      esac
      echo "Press CTRL+C to exit"
      echo "$variable : ($grep_pattern) jobs"
      execute_ command "$variable" "$grep_pattern" "$color"
      sleep 3
    done
  done
done
