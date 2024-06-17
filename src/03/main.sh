#!/bin/bash

exit_with_error() {
  echo -e ${color1} "Error: $1"
  exit 1
}

outputter() {
  echo -e ${color_name}"HOSTNAME${DEFAULT} =" ${color_value}"$hostname"${DEFAULT}
  echo -e ${color_name}"TIMEZONE${DEFAULT} =" ${color_value}"$timezone"${DEFAULT}
  echo -e ${color_name}"USER${DEFAULT} =" ${color_value}"$user"${DEFAULT}
  echo -e ${color_name}"OS${DEFAULT} =" ${color_value}"$os"${DEFAULT}
  echo -e ${color_name}"DATE${DEFAULT} =" ${color_value}"$date"${DEFAULT}
  echo -e ${color_name}"UPTIME${DEFAULT} =" ${color_value}"$uptime"${DEFAULT}
  echo -e ${color_name}"UPTIME_SEC${DEFAULT} =" ${color_value}"$uptime_sec"${DEFAULT}
  echo -e ${color_name}"IP${DEFAULT} =" ${color_value}"$ip"${DEFAULT}
  echo -e ${color_name}"MASK${DEFAULT} =" ${color_value}"$mask"${DEFAULT}
  echo -e ${color_name}"GATEWAY${DEFAULT} =" ${color_value}"$gateway"${DEFAULT}
  echo -e ${color_name}"RAM_TOTAL${DEFAULT} =" ${color_value}"$ram_total"${DEFAULT}
  echo -e ${color_name}"RAM_USED${DEFAULT} =" ${color_value}"$ram_used"${DEFAULT}
  echo -e ${color_name}"RAM_FREE${DEFAULT} =" ${color_value}"$ram_free"${DEFAULT}
  echo -e ${color_name}"SPACE_ROOT${DEFAULT} =" ${color_value}"$space_root"${DEFAULT}
  echo -e ${color_name}"SPACE_ROOT_USED${DEFAULT} =" ${color_value}"$space_root_used"${DEFAULT}
  echo -e ${color_name}"SPACE_ROOT_FREE${DEFAULT} =" ${color_value}"$space_root_free"${DEFAULT}
}

if [ $# -ne 4 ]
then
exit_with_error "incorrect number of parameters. Use: main.sh <name background> <name color> <value background> <value color>"
fi

for param in "$@"
do
  if ! [[ "$param" =~ ^[1-6]$ ]]
  then
    exit_with_error "invalid parameter. The parameters must be numbers from 1 to 6."
  fi
done

bg_name=$1
font_name=$2
bg_value=$3
font_value=$4

if [[ $bg_name -eq $font_name || $bg_value -eq $font_value ]]
then
  exit_with_error "font and background colors are the same"
fi

. ./colors.sh
. ./../02/info.sh
outputter
