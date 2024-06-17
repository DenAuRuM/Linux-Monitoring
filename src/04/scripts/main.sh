#!/bin/bash

export colours_output
export colours_term
#shellcheck source=utils/config.info
#shellcheck source=utils/colours.sh
#shellcheck source=utils/utils.sh



exit_with_error() {
  echo -e "Error: $1"
  exit 1
}


check_parameters() {
if ! [[ "$1" =~ ^[1-6]$ ]]
  then 
    colours_output[i]="default"
    if [[ i -eq 0 || i -eq 2 ]]
    then
      colours[i]=$column_background_default
    else
      colours[i]=$column_font_default
    fi
  else
    colours[i]=$1
    colours_output[i]=$1
  fi
  ((i++))
}

if [ $# -ne 0 ]
    then
    exit_with_error "\033[31mNo any parameters expected\033[0m"
fi

column_background_default=6
column_font_default=1
i=0
colours=("" "" "" "")
colours_output=("" "" "" "")
colours_term=("" "" "" "")

while IFS= read -r line;
do
  if [[ $line =~ "column1_background=" ]]; then
    colour[0]="${line//*=/}"
    check_parameters "${colour[0]}"
  elif [[ $line =~ "column1_font_color" ]]; then
    colour[1]="${line//*=/}"
    check_parameters "${colour[1]}"
  elif [[ $line =~ "column2_background=" ]]; then
    colour[2]="${line//*=/}"
    check_parameters "${colour[2]}"
  elif [[ $line =~ "column2_font_color" ]]; then
    colour[3]="${line//*=/}"
    check_parameters "${colour[3]}"
  fi
done < utils/config.info

if  [[ "${colours[0]}" -eq "${colours[1]}"  ||  "${colours[2]}" -eq "${colours[3]}" ]]
    then
    exit_with_error "\033[31mThe font and background colours of one column mustn't match.\033[0m"
fi

source utils/colour.sh
source utils/utils.sh
source utils/config.info