#!/bin/bash
#add fix to exercise6-fix here
echo "FILES: ${@}"
FILES="$@"
echo "---------------------------"
echo "LAST: ${@: -1}"
LAST="${@: -1}"
echo "--------------------------"

        for f in $FILES
        do
                if [ "$f" = "$LAST" ];then
                        echo "we got to the last argument"
                        break

                fi
                echo "sudo cp $f $LAST "
                sudo cp $f $LAST
        done

