MQL4SDK Compiler
===

This project provides a docker image for you guy to run github action or any CICD tool that use the docker container to run CICD.

### How can I do that?
1. `metaeditor` can compile from the command line
2. by using `wine`, `metaeditor` or many `.exe` programs can run in Ubuntu/Linux

### What exactly the project is trying to do?
- Create a docker image (a blackbox)
- You need mount your `MQL` folder (contains source code or input) and the `build` (the `ex4` and compiling `log` files - output)
- Run the docker command 
```
docker run -v "MQL4:/home/oriole/mql4" -v "Build:/home/oriole/build" vuthailinh/mql4sdk-compiler
```
