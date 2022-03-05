#!/bin/bash
git log -1 > version.txt
echo -e "\n\n===" >> version.txt
echo "Built on `hostname` by `whoami` at `date`" >> version.txt
docker build -t eamt4sdk-compiler:latest -t vuthailinh/eamt4sdk-compiler:latest .