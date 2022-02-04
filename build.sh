#!/bin/bash
git log -1 > version.txt
echo `hostname` >> version.txt
echo `$PWD` >> version.txt
docker build -t eamt4sdk-compiler:latest -t vuthailinh/eamt4sdk-compiler:latest .