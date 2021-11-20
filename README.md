MQL4SDK Compiler
===

> This project provides a docker image that can run in github action or any CICD tool, that use the docker container to run CICD.

### How can I do that?
1. `metaeditor` can compile from the command line
   - try to run `metaeditor.exe /help` in your command promt
2. by using `wine`, `metaeditor` or many `.exe` programs can run in Ubuntu/Linux


### Input to run
- Your `MQL4` folder => `/mt4/source`
- the `build` folder => `/mt4/output`, which will contains the `ex4` (output) and compiling `log` files

### Compiling command
```
docker run --rm -v "$PWD/mql4-expert-advisors:/mt4/source" -v "$PWD/build:/mt4/output" vuthailinh/eamt4sdk-compile
```