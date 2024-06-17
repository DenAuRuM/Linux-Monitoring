#!/bin/bash



info_about_device() {
    if [ "$(uname)" == "Darwin" ]; then
    echo "HOSTNAME = $(hostname)"
    echo "TIMEZONE = $(ls -l /etc/localtime | awk -F/ '{print $8"/"$9}') UTC $(date +%z)"
    echo "USER = $(whoami)"
    echo "OS = $(sw_vers -productName | cut -d '.' -f 1,2 | tr '\n' ' ' && \
                 sw_vers -productVersion | cut -d '.' -f 1,2)"
    echo "DATE = $(date +"%d %B %Y %H:%M:%S")"
    echo "UPTIME = $(uptime | awk '{print $2, $3, $4, $5}')"
    echo "UPTIME_SEC = $(( $(date +%s) - $(sysctl -n kern.boottime | awk -F'[ ,]' '{print $4}') ))"
    echo "IP = $(ipconfig getifaddr en0)"
    echo "MASK = $(ifconfig en0 | grep 'netmask' | cut -d ' ' -f 4 | tr -d 'x' | xargs -I {} bash -c 'printf "%d.%d.%d.%d\n" $((0x{}>>24&255)) $((0x{}>>16&255)) $((0x{}>>8&255)) $((0x{}&255))'
)"
    echo "GATEWAY = $(route -n get default | grep 'gateway' | awk '{print $2}')"
    echo "RAM_TOTAL = $(system_profiler SPHardwareDataType | grep "Memory:" | awk '{printf "%.3f GB\n", $2}')"
    echo "RAM_USED = $(top -l 1 | awk '/PhysMem/ {printf "%.3f GB\n", $2}')"
    echo "RAM_FREE = $(top -l 1 | awk '/PhysMem/ {printf "%.3f GB\n", $8/1024}' )"
    echo "SPACE_ROOT = $(df -m / | grep '/dev/disk2s4s1' | awk '{printf "%.2f MB\n", $2}')"
    echo "SPACE_ROOT_USED = $(df -m / | grep '/dev/disk2s4s1' | awk '{printf "%.2f MB\n", $3}')"
    echo "SPACE_ROOT_FREE = $(df -m / | grep '/dev/disk2s4s1' | awk '{printf "%.2f MB\n", $4}')"

    elif [ "$(uname)" == "Linux" ]; then
    
    echo "HOSTNAME = $(hostname)"
    echo "TIMEZONE = $(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5, $6}' )"
    echo "USER = $(whoami)"
    echo "OS = $(uname)"
    echo "DATE = $(date "+%d %B %Y %T")"
    echo "UPTIME = $(uptime -p)"
    echo "UPTIME_SEC = $(cat /proc/uptime | awk '{printf "%i sec\n", $1}')"
    echo "IP = $(hostname -I)"
    echo "MASK = $(ifconfig | grep -m1 'netmask' | awk '{print $4}')"
    echo "GATEWAY = $(ip r | grep 'default' | awk '{print $3}')"
    echo "RAM_TOTAL = $(free | grep 'Mem' | awk '{printf "%.3f GB\n", $2/1024/1024}')"
    echo "RAM_USED = $(free | grep 'Mem' | awk '{printf "%.3f GB\n", $3/1024/1024}')"
    echo "RAM_FREE = $(free | grep 'Mem' | awk '{printf "%.3f GB\n", $4/1024/1024}')"
    echo "SPACE_ROOT = $(df -m / | grep 'dev' | awk '{printf "%.2f MB", $2}')"
    echo "SPACE_ROOT_USED = $(df -m / | grep 'dev' | awk '{printf "%.2f MB", $3}')"
    echo "SPACE_ROOT_FREE = $(df -m / | grep 'dev' | awk '{printf "%.2f MB", $4}')"
    fi
    #+"%d %m %y %H:%M:%S"
}

