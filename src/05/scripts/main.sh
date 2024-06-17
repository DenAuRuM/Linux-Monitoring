#!/bin/bash

# shellcheck source=utils.sh
source utils/utils.sh

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

exit_with_error() {
  echo -e "Error: $1"
  exit 1
}

if [ $# -ne 1 ]
    then
    exit_with_error "Incorrect number of parameters."
fi

if [ ! -d "$1" ]
    then
    exit_with_error "Directory '$1' does not exist"
fi

main(){
    echo "Total number of folders (including all nested ones) = $total_folders"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
        counter=1
        for folder in $top_folders; do
            size=$(du -shc "$folder" 2>/dev/null | grep -v "total" | awk '{print $1}')
            echo "$counter - $folder, $size"
            counter=$((counter + 1))
        done

    echo "Total number of files = $number_files"
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $configuragion_files"
    echo "Text files = $text_files"
    echo "Executable files = $executable_files"
    echo "Log files (with the extension .log) = $log_files"
    echo "Archive files = $archive_files"
    echo "Symbolic links = $symbolic_links"
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
        counter_files=1
        for file in $top_files; do
            filename=$(basename "$file")
            type="${filename##*.}"
            size=$(du -shc "$file" 2>/dev/null | grep -v "total" | awk '{print $1}')
            echo "$counter_files - $file, $size, $type"
            counter_files=$((counter_files + 1))
        done
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
        if [ "$(uname)" == "Linux" ]; then
            exe_files_count=1
            for file_ex in $top_executable; do
                hash=$(md5sum "$file_ex" 2>/dev/null | awk '{print $1}')
                size=$(du -shc "$file_ex" 2>/dev/null | grep -v "total" | awk '{print $1}')
                echo "$exe_files_count - $file_ex, $size, $hash"
                exe_files_count=$((exe_files_count + 1))
            done
        elif [ "$(uname)" == "Darwin" ]; then
            exe_files_count=1
            for file_ex in $top_executable_mac; do
                hash=$(md5 -q "$file_ex" 2>/dev/null)
                size=$(du -shc "$file_ex" 2>/dev/null | grep -v "total" | awk '{print $1}')
                echo "$exe_files_count - $file_ex, $size, $hash"
                exe_files_count=$((exe_files_count + 1))
            done
        fi
}

#script_time_start=$(date +%s)
# SECONDS=0
main "$@"
#script_time_end=$(date +%s)
#script_time_execution=$(echo "$script_time_end-$script_time_start")
#echo "Script execution time: $(($script_time_end-$script_time_start)) seconds"
echo "Script execution time (in seconds) = $SECONDS "

