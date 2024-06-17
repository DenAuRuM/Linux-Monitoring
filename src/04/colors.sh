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

colors_term_find(){
    case $1 in
        1) echo '(white)';;
        2) echo '(red)';;
        3) echo '(green)';;
        4) echo '(blue)';;
        5) echo '(purple)';;
        6) echo '(black)';;
    esac
}

color_name=$(fc_color "${colors[1]}")$(bg_color "${colors[0]}")
echo "!@!" "$color_name"
color_value=$(fc_color "${colors[3]}")$(bg_color "${colors[2]}")
colors_term[0]=$(colors_term_find ${colors[0]})
colors_term[1]=$(colors_term_find ${colors[1]})
colors_term[2]=$(colors_term_find ${colors[2]})
colors_term[3]=$(colors_term_find ${colors[3]})