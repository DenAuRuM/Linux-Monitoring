#!/bin/bash

script_time_begin=`date +%s.%N`

exit_with_error() {
  echo -e ${color1} "Error: $1"
  exit 1
}

if [ $# -ne 1 ]
  then
  exit_with_error "incorrect number of parameters"
fi

if [ ! -d "$1" ]
  then
  exit_with_error "directory '$1' does not exist"
fi

 . ./info.sh

echo "Total number of folders (including all nested ones) = "$total_folders""

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
counter=1
for folder in $top_folders; do
  size=$(du -shc "$folder" 2>/dev/null | grep -v "total" | awk '{print $1}')
  echo "$counter - $folder, $size"
  counter=$((counter + 1))
done

echo "Total number of files = "$number_files""
echo "Number of:"
echo "Configuration files (with the .conf extension) = "$configuration_files""
echo "Text files = "$text_files""
echo "Executable files = "$executable_files""
echo "Log files (with the extension .log) = "$log_files""
echo "Archive files = "$archive_files""
echo "Symbolic links = "$symbolic_links""

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
counter_file=1
for file in $top_files; do
  type=${file##*.}
  size=$(du -shc "$file" 2>/dev/null | grep -v "total" | awk '{print $1}')
  echo "$counter_file - $file, $size, $type"
  counter_file=$((counter_file + 1))
done

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
counter_file=1
 echo $top_executables
for file_ex in $top_executables; do
  hash=$(md5sum "$file_ex" 2>/dev/null | awk '{print $1}')
  size=$(du -shc "$file_ex" 2>/dev/null | grep -v "total" | awk '{print $1}')
  echo "$counter_file - $file_ex, $size, $hash"
  counter_file=$((counter_file + 1))
done

script_time_end=`date +%s.%N`
script_time_execution=$(echo "$script_time_end-$script_time_begin" | bc | numfmt --format="%0.1f")
echo 'Script execution time (in seconds) = '$script_time_execution