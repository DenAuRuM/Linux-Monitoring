#!/bin/bash

DEFAULT='\033[0m'

bg_color(){
    case "$1" in
        1) echo '\033[47m';;
        2) echo '\033[41m';;
        3) echo '\033[42m';;
        4) echo '\033[44m';;
        5) echo '\033[45m';;
        6) echo '\033[40m';;       
    esac
}

fc_color(){
    case $1 in
        1) echo '\033[1;37m';;
        2) echo '\033[0;31m';;
        3) echo '\033[0;32m';;
        4) echo '\033[0;34m';;
        5) echo '\033[0;35m';;
        6) echo '\033[0;30m';;       
    esac
}

color_name=$(fc_color $2)$(bg_color $1)
color_value=$(fc_color $4)$(bg_color $3)
