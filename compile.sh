#!/bin/bash
for f in `ls source/Experts|grep mq4|grep -v log`; do
    WINEDEBUG=-all wine sdk/metaeditor.exe /compile:source/Experts/$f /include:source /log:output/$f.log

    if [ $? -ne 1 ]; then # metaeditor return 1 if compiling is success
        cat output/$f.log
        exit 1
    fi

    echo "\n---\nCompiled on `date`\nLV" >> $f.log 
done

find source/Experts -type f -name "*.ex4" -exec mv {} output \;
find output -type f

exit 0