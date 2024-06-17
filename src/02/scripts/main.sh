#!/bin/bash

source utils/utils.sh


info_about_device "$@"


read -p "Would you like to save the data to a file? (Y/N): " answer

if [[ $answer == "Y" || $answer == "y" ]]; then
    filename=$(date +"%d_%m_%y_%H_%M_%S.status")
    info_about_device >> "$filename"
    echo "Data saved in the directory 02"
else
    echo "The parameter wasn't 'Y' or 'y', so the data output won't be saved"
fi

