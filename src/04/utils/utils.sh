#!/bin/bash

#shellcheck source=colour.sh
export colour_name
export colour_value
export colours_output
export colours_term

info_about_device() {
    if [ "$(uname)" == "Darwin" ]; then
        echo -e "${colour_name}HOSTNAME${ENDCOLOUR} = ${colour_value}$(hostname)${ENDCOLOUR}" 
        echo -e "${colour_name}TIMEZONE${ENDCOLOUR} = ${colour_value}$(ls -l /etc/localtime | awk -F/ '{print $8"/"$9}') UTC $(date +%z)${ENDCOLOUR}"
        echo -e "${colour_name}USER${ENDCOLOUR} = ${colour_value}$(whoami)${ENDCOLOUR}"
        echo -e "${colour_name}OS${ENDCOLOUR} = ${colour_value}$(sw_vers -productName | cut -d '.' -f 1,2 | tr '\n' ' ' && \
                    sw_vers -productVersion | cut -d '.' -f 1,2)${ENDCOLOUR}" '\033[0m'
        echo -e "${colour_name}DATE${ENDCOLOUR} = ${colour_value}$(date +"%d %B %Y %H:%M:%S")${ENDCOLOUR}"
        echo -e "${colour_name}UPTIME${ENDCOLOUR} = ${colour_value}$(uptime | awk '{print $2, $3, $4, $5}')${ENDCOLOUR}"
        echo -e "${colour_name}UPTIME_SEC${ENDCOLOUR} = ${colour_value}$(( $(date +%s) - $(sysctl -n kern.boottime | awk -F'[ ,]' '{print $4}') ))${ENDCOLOUR}"
        echo -e "${colour_name}IP${ENDCOLOUR} = ${colour_value}$(ipconfig getifaddr en0)${ENDCOLOUR}"
        echo -e "${colour_name}MASK${ENDCOLOUR} = ${colour_value}$(ifconfig en0 | grep 'netmask' | cut -d ' ' -f 4 | tr -d 'x' | xargs -I {} bash -c 'printf "%d.%d.%d.%d\n" $((0x{}>>24&255)) $((0x{}>>16&255)) $((0x{}>>8&255)) $((0x{}&255))'
        )${ENDCOLOUR}"
        echo -e "${colour_name}GATEWAY${ENDCOLOUR} = ${colour_value}$(route -n get default | grep 'gateway' | awk '{print $2}')${ENDCOLOUR}"
        echo -e "${colour_name}RAM_TOTAL${ENDCOLOUR} = ${colour_value}$(system_profiler SPHardwareDataType | grep "Memory:" | awk '{printf "%.3f GB\n", $2}')${ENDCOLOUR}"
        echo -e "${colour_name}RAM_USED${ENDCOLOUR} = ${colour_value}$(top -l 1 | awk '/PhysMem/ {printf "%.3f GB\n", $2}')${ENDCOLOUR}"
        echo -e "${colour_name}RAM_FREE${ENDCOLOUR} = ${colour_value}$(top -l 1 | awk '/PhysMem/ {printf "%.3f GB\n", $8/1024}' )${ENDCOLOUR}"
        echo -e "${colour_name}SPACE_ROOT${ENDCOLOUR} = ${colour_value}$(df -m / | grep '/dev/disk2s4s1' | awk '{printf "%.2f MB\n", $2}')${ENDCOLOUR}"
        echo -e "${colour_name}SPACE_ROOT_USED${ENDCOLOUR} = ${colour_value}$(df -m / | grep '/dev/disk2s4s1' | awk '{printf "%.2f MB\n", $3}')${ENDCOLOUR}"
        echo -e "${colour_name}SPACE_ROOT_FREE${ENDCOLOUR} = ${colour_value}$(df -m / | grep '/dev/disk2s4s1' | awk '{printf "%.2f MB", $4}')${ENDCOLOUR}"
        
        
    elif [ "$(uname)" == "Linux" ]; then
        echo -e "${colour_name}HOSTNAME${ENDCOLOUR} = ${colour_value}$(hostname)${ENDCOLOUR}"
        echo -e "${colour_name}TIMEZONE${ENDCOLOUR} = ${colour_value}$(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5, $6}')${ENDCOLOUR}"
        echo -e "${colour_name}USER${ENDCOLOUR} = ${colour_value}$(whoami)${ENDCOLOUR}"
        echo -e "${colour_name}OS${ENDCOLOUR} = ${colour_value}$(uname)${ENDCOLOUR}"
        echo -e "${colour_name}DATE${ENDCOLOUR} = ${colour_value}$(date "+%d %B %Y %T")${ENDCOLOUR}"
        echo -e "${colour_name}UPTIME${ENDCOLOUR} = ${colour_value}$(uptime -p)${ENDCOLOUR}"
        echo -e "${colour_name}UPTIME_SEC${ENDCOLOUR} = ${colour_value}$(cat /proc/uptime | awk '{printf "%i sec\n", $1}')${ENDCOLOUR}"
        echo -e "${colour_name}IP${ENDCOLOUR} = ${colour_value}$(hostname -I)${ENDCOLOUR}"
        echo -e "${colour_name}MASK${ENDCOLOUR} = ${colour_value}$(ifconfig | grep -m1 'netmask' | awk '{print $4}')${ENDCOLOUR}"
        echo -e "${colour_name}GATEWAY${ENDCOLOUR} = ${colour_value}$(ip r | grep 'default' | awk '{print $3}')${ENDCOLOUR}"
        echo -e "${colour_name}RAM_TOTAL${ENDCOLOUR} = ${colour_value}$(free | grep 'Mem' | awk '{printf "%.3f GB\n", $2/1024/1024}')${ENDCOLOUR}"
        echo -e "${colour_name}RAM_USED${ENDCOLOUR} = ${colour_value}$(free | grep 'Mem' | awk '{printf "%.3f GB\n", $3/1024/1024}')${ENDCOLOUR}"
        echo -e "${colour_name}RAM_FREE${ENDCOLOUR} = ${colour_value}$(free | grep 'Mem' | awk '{printf "%.3f GB\n", $4/1024/1024}')${ENDCOLOUR}"
        echo -e "${colour_name}SPACE_ROOT${ENDCOLOUR} = ${colour_value}$(df -m / | grep 'dev' | awk '{printf "%.2f MB", $2}')${ENDCOLOUR}"
        echo -e "${colour_name}SPACE_ROOT_USED${ENDCOLOUR} = ${colour_value}$(df -m / | grep 'dev' | awk '{printf "%.2f MB", $3}')${ENDCOLOUR}"
        echo -e "${colour_name}SPACE_ROOT_FREE${ENDCOLOUR} = ${colour_value}$(df -m / | grep 'dev' | awk '{printf "%.2f MB", $4}')${ENDCOLOUR}" 
    fi
}

info_about_device
echo 
echo "Column 1 background =" "${colours_output[0]}" "${colours_term[0]}"
echo "Column 1 font colour =" "${colours_output[1]}" "${colours_term[1]}"
echo "Column 2 background =" "${colours_output[2]}" "${colours_term[2]}"
echo "Column 2 font colour =" "${colours_output[3]}" "${colours_term[3]}"