#!/bin/bash

# shellcheck disable=SC2154

# totf=total_folders
# tf=top_folders
# nf=number_files
# cf=configuragion_files
# txtfiles=text_files
# exefiles=executable_files
# logfiles=log_files
# archfiles=archive_files
# symln=symbolic_links
# topfiles=top_files
# topexe=top_executable

export total_folders
export top_folders
export number_files
export configuragion_files
export text_files
export executable_files
export log_files
export archive_files
export symbolic_links
export top_files
export top_executable
export top_executable_mac


total_folders=$(find "$1" -mindepth 1 -type d 2>/dev/null | wc -l)
top_folders=$(du "$1" -h 2>/dev/null | sort -hr | head -n 6 | tail -n +2 | awk '{ print $2 }')
number_files=$(find "$1" -mindepth 1 -type f 2>/dev/null | wc -l)
configuragion_files=$(find "$1" -mindepth 1 -type f -name "*.conf" 2>/dev/null | wc -l)
text_files=$(find "$1" -mindepth 1 -type f -exec file {} \; | grep -c "text" 2>/dev/null)
executable_files=$(find "$1" -mindepth 1 -type f -exec file {} \; | grep -c "executable" 2>/dev/null)
log_files=$(find "$1" -mindepth 1 -type f -name "*.log" 2>/dev/null | wc -l)
archive_files=$(find "$1" -mindepth 1 -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) -exec file {} \; | wc -l 2>/dev/null)
symbolic_links=$(find "$1" -mindepth 1 -type l 2>/dev/null | wc -l)
top_files=$(find "$1" -type f -exec du -ah {} + | sort -rh | head -n 10 | awk '{print $2}' 2>/dev/null)
top_executable=$(find "$1" -type f -executable 2>/dev/null | sort -rh | head -n 10 | awk '{print $1}' )
top_executable_mac=$(find "$1" -type f -perm +111 -exec du -h {} + 2>/dev/null | head -n 10 | sort -rh | awk '{ print $2 }' )
