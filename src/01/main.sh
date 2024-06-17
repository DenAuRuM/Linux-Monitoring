#!/bin/bash

if [ $# -ne 1 ]
then
echo "Error: invalid number of parameters"
exit 1
elif [[ $1 =~ ^[+-]?+[0-9]+(\.([0-9]+)?)?+$ ]]
then
echo "Error: a number was entered, text was expected."
exit 1
else
echo "$1"
fi