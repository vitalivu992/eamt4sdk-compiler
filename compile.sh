#!/bin/bash
for f in `ls /mql4/Experts|grep mq4`; do
    wine ~/mt4sdk/metaeditor.exe /compile:"$f" /include:"$HOME/mql4" /log:"$HOME/logs/$f.log"
done
find $HOME/mq4/Experts -type f -name "*.ex4" -exec mv {} $HOME/build \;
exit 0