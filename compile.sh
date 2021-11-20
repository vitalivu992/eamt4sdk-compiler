#!/bin/bash

# metaeditor.exe /compile:"MQL4\Experts\FocusPanel.mq4" /include:MQL4 /log:x.log

for f in `ls /mql4/Experts|grep mq4`; do
    wine ~/mt4sdk/metaeditor.exe /compile:"$f" /include:"$HOME/mql4" /log:"$HOME/build/$f.log"
done
find $HOME/mq4/Experts -type f -name "*.ex4" -exec mv {} $HOME/build \;
exit 0