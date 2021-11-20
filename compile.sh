#!/bin/bash

echo "$#"
if [[ $# -gt 0 ]]; then
    source=$1
else 
    source="source"
fi

for f in `ls $source/Experts|grep mq4|grep -v log`; do
    WINEDEBUG=-all wine /mt4/sdk/metaeditor.exe /compile:$source/Experts/$f /include:$source /log:/mt4/output/$f.log

    if [ $? -ne 1 ]; then # metaeditor return 1 if compiling is success
        cat /mt4/output/$f.log
        exit 1
    fi

    echo "\n---\nCompiled on `date`\nLV" >> $f.log 
done

find $source/Experts -type f -name "*.ex4" -exec mv {} /mt4/output \;
find /mt4/output -type f

exit 0