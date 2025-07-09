#!/bin/bash

path='/root/shell/testfile' # change the path as required

# Files modified less than 7 days ago
mapfile -t recent_files < <(find $path -type f -mtime -7 ! -name '.*' ! -path '*/.*/*') 

for filename in "${recent_files[@]}";do
    echo "Deleting modified files < 7 days ago: $filename"
    #rm -f "$filename" #enable this to delete files
done    


# Files modified more than 7 days ago
mapfile -t old_files < <(find $path -type f -mtime +7 ! -name '.*' ! -path '*/.*/*') 

for filename in "${old_files[@]}";do
    echo "Deleting modified files > 7 days ago: $filename"
    #rm -f "$filename" #enable this to delete files
done 

# Files modified exactly equal to 7 days
mapfile -t exact_files < <(find $path -type f -mtime 7 ! -name '.*' ! -path '*/.*/*') 

for filename in "${exact_files[@]}";do
    echo "Deleting modified files exactly equal to 7 days: $filename"
    #rm -f "$filename" #enable this to delete files
done 
