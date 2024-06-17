#!/bin/bash
#shellcheck source=config.info

export ENDCOLOUR
export colour
export colour_name
export colour_value
export colours_term
ENDCOLOUR='\033[0m'


txt_colour() {
    case $1 in
        1) printf '\033[97m' ;; # White  
        2) printf '\033[31m' ;; # Red
        3) printf '\033[32m' ;; # Green
        4) printf '\033[34m' ;; # Blue
        5) printf '\033[35m' ;; # Purple
        6) printf '\033[30m' ;; # Black 
    esac
}

bckgrnd_colour() {
    case "$1" in
        1) printf '\033[47m' ;; #  Light grey background
        2) printf '\033[41m' ;; #  Red background
        3) printf '\033[42m' ;; #  Green background
        4) printf '\033[44m' ;; #  Blue background
        5) printf '\033[45m' ;; #  Purple background
        6) printf '\033[40m' ;; #  Black background
    esac
}

find_colour_of_term(){
    case "$1" in
        1) printf '(white)' ;;
        2) printf '(red)' ;;
        3) printf '(green)' ;;
        4) printf '(blue)' ;;
        5) printf '(purple)' ;;
        6) printf '(black)' ;;
    esac
}

colour_name=$(txt_colour "${colour[1]}")$(bckgrnd_colour "${colour[0]}")
colour_value=$(txt_colour "${colour[3]}")$(bckgrnd_colour "${colour[2]}")
colours_term[0]=$(find_colour_of_term "${colour[0]}")
colours_term[1]=$(find_colour_of_term "${colour[1]}")
colours_term[2]=$(find_colour_of_term "${colour[2]}")
colours_term[3]=$(find_colour_of_term "${colour[3]}")
