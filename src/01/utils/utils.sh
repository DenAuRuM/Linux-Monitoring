#!/bin/bash

input_validation() {
    case "$#" in
    0)
        echo "Incorrect parameter has been entered. Usage: bash scripts/main.sh <parameter>"
        ;;
    1)
        case "$1" in     
        *[0-9]*)
            echo "Incorrect parameter, only text was expected"
            ;;
        *[!a-zA-Z0-9\@\#%^\&\*\(\):_+=-$]*)
            echo "Incorrect parameter, only text was expected"
            ;;
        *)
            echo "Entered parameter: $1"
            ;;
        esac
        ;;
    *)
        echo "There are two or more parameters, only 1 expected"
        ;;
    esac
}
