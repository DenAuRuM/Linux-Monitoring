#!/bin/bash

exit_with_error() {
  echo -e "Error: $1"
  exit 1
}

if [ $# -ne 4 ]
    then
    exit_with_error "\033[31mIncorrect type of the input. \
Usage: bash scripts/main.sh <name bckgrnd> <name colour> <value bckgrnd> <value colour>\033[0m"
fi

for param in "$@"
do 
  if ! [[ "$param" =~ ^[1-6]$ ]]
  then 
  exit_with_error "\033[31mThere should be only integers from 1 to 6.\033[0m"
fi
done

bg_name=$1
txt_name=$2
bg_value=$3
txt_value=$4

if  [ "${bg_name}" -eq "${txt_name}" ] || [ "${bg_value}" -eq "${txt_value}" ];
    then
    exit_with_error "\033[31mThe font and background colours of one column mustn't match.\033[0m"
fi

source utils/colours.sh
source utils/utils.sh
info_about_device "$@"
