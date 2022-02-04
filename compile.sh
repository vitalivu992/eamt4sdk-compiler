#!/bin/bash
if [[ $# -gt 0 ]]; then
    source=$1
else 
    source="input"
fi

rm -rf $source/Experts/*.log $source/Experts/*.ex4
for f in `ls $source/Experts|grep mq4|grep -v log`; do
    echo "=============================================="
    echo "Compiling EA $f"
    # cat $source/Experts/$f
    touch $source/Experts/$f.log
    WINEDEBUG=-all wine /mt4/sdk/metaeditor.exe /compile:$source/Experts/$f /log:$source/Experts/$f.log /include:$source
    if [ $? -ne 0 ]; then # metaeditor return 1 if compiling is success
        if [ -f $source/Experts/$f.log ]; then
            cat $source/Experts/$f.log
        fi
        echo "----------------------------------------------"
        echo "Failed when compiling EA $f. See the log above"
        exit 1
    else
        echo "----------------------------------------------"
        echo "Successfully compile EA $f"
    fi

    echo "\n---\nCompiled on `date`\nLV" >> $f.log 
done

find $source/Experts -type f

exit 0