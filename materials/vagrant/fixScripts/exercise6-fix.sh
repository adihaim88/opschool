#!/bin/bash

if [ $# -lt 3 ]; then
    echo "Usage: $0 file1 file2 ... destination_folder"
    exit 1
fi

#echo "FILES: ${@}"
FILES="$@"
#echo "---------------------------"
#echo "LAST: ${@: -1}"
LAST="${@: -1}"
#echo "--------------------------"
hostname=$(hostname)
# Print the hostname
echo "Hostname: $hostname"

if [ "$hostname" = "server1" ];then 
        secondhostname=server2
        else
        secondhostname=server1
        echo "secondhostname: $secondhostname"
fi

        size=0
        Total=0
        for f in $FILES
        do
                if [ "$f" = "$LAST" ];then
                        echo "we got to the last argument"
                        break

                fi
                echo "sudo cp $f $LAST "
                echo "----------------------------"
                sudo cp  $f $LAST
                echo "echo : $(stat -c %s $f)"
                size=$(stat -c %s $f)
                echo $size>>calc.csv
        done

        awk '{Total=Total+$1} END{print "Total is: " Total}' calc.csv

