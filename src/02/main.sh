#!/bin/bash

exit_with_error() {
  echo -e ${color1} "Error: $1"
  exit 1
}

outputter() {
  echo "HOSTNAME = $hostname"
  echo "TIMEZONE = $timezone"
  echo "USER = $user"
  echo "OS = $os"
  echo "DATE = $date"
  echo "UPTIME = $uptime"
  echo "UPTIME_SEC = $uptime_sec"
  echo "IP = $ip"
  echo "MASK = $mask"
  echo "GATEWAY = $gateway"
  echo "RAM_TOTAL = $ram_total"
  echo "RAM_USED = $ram_used"
  echo "RAM_FREE = $ram_free"
  echo "SPACE_ROOT = $space_root"
  echo "SPACE_ROOT_USED = $space_root_used"
  echo "SPACE_ROOT_FREE = $space_root_free"
}

if [ $# -ne 0 ]
  then
  exit_with_error "incorrect number of parameters"
fi

. ./info.sh

outputter

read -p "Would you like to save the data to a file? (Y/N): " answer

if [[ $answer == "Y" || $answer == "y" ]]
  then
  filename=$(date +"%d_%m_%y_%H_%M_%S.status")
  outputter >> $filename
fi
