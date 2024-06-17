#!/bin/bash

ENDCOLOUR='\033[0m'
export ENDCOLOUR

txt_colour() {
    case $1 in
        1) printf '\033[97m';; # White  
        2) printf '\033[31m';; # Red
        3) printf '\033[32m';; # Green
        4) printf '\033[34m';; # Blue
        5) printf '\033[35m';; # Purple
        6) printf '\033[30m';; # Black 
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

colour_name=$(bckgrnd_colour "$1")$(txt_colour "$2")
export colour_name

colour_value=$(bckgrnd_colour "$3")$(txt_colour "$4")
export colour_value