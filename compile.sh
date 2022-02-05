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
    if [ -f $source/Experts/$f.log ]; then
        cat $source/Experts/$f.log
    fi
done

find $source/Experts -type f

exit 0
