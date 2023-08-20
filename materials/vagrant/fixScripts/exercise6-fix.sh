#!/bin/bash
echo "FILES: ${@}"
FILES="$@"
echo "---------------------------"
echo "LAST: ${@: -1}"
LAST="${@: -1}"
echo "--------------------------"

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

