#!/bin/bash
dir="$1"
if [ -d $dir ]; then
    echo -e "Checking disk usage in $dir \n"
else
    echo "$dir directory does not exist, exiting."
    exit 101
fi
echo "The heaviest subfolder of $dir is: "
top1=$(du -S $dir | sort -rn | head -n 1 | awk '{print $2 "\n"}' )
disk=$(du -h $top1 | awk '{print $1}')
echo -e "$top1"
echo -e "$disk"
echo "The heaviest subfolder of $dir is: $top1" | festival --tts

