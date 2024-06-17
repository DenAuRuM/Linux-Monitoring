#!/bin/bash

exit_with_error() {
  echo -e ${color1} "Error: $1"
  exit 1
}

check_parametrs() {
if ! [[ "$1" =~ ^[1-6]$ ]]
  then
    colors_output[i]="default"
    if [[ i -eq 0 || i -eq 2 ]]
    then
      colors[i]=$column_background_default
    else
      colors[i]=$column_font_default
    fi
  else
    colors[i]="$1"
    colors_output[i]="$1"
  fi
  i=$(( $i + 1))
}

if [ $# -ne 0 ]
  then
  exit_with_error "incorrect number of parameters"
fi

column_background_default=6
column_font_default=1
i=0
colors=("" "" "" "")
colors_output=("" "" "" "")
colors_term=("" "" "" "")

while IFS= read -r line; do
  if [[ $line =~ "column1_background=" ]]; then
     colors[0]=$(echo $line | sed 's/.*=//')
     check_parametrs "${colors[0]}"
  elif [[ $line =~ 'column1_font_color=' ]]; then
     colors[1]=$(echo $line | sed 's/.*=//')
     check_parametrs "${colors[1]}"
  elif [[ $line =~ 'column2_background=' ]]; then
     colors[2]=$(echo $line | sed 's/.*=//')
     check_parametrs "${colors[2]}"
  elif [[ $line =~ 'column2_font_color=' ]]; then
     colors[3]=$(echo $line | sed 's/.*=//')
     check_parametrs "${colors[3]}"
  fi
done < config.info

if [[ ${colors[0]} == ${colors[1]} || ${colors[3]} == ${colors[2]} ]]
  then 
  exit_with_error "front and background colors are the same"
fi

. ./colors.sh
. ./../02/info.sh
. ./outputter.sh

