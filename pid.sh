#!/bin/bash

cpu_usage=0 # change the cpu usage as required.

mapfile -t my_array < <(ps -eo pid,%cpu --sort=-%cpu | awk -v threshold="$cpu_usage" '$2 >threshold {print $1}')

for pid in "${my_array[@]}";do
        echo "$pid"
        #kill -9 "$pid"  # enable this to kill process id.
done
