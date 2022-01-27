MQL4SDK Compiler
===

> This project provides a docker image that can run in github action or any CICD tool, that use the docker container to run CICD.

### How can I do that?
1. `metaeditor` can compile from the command line
   - try to run `metaeditor.exe /help` in your command promt
2. by using `wine`, `metaeditor` or many `.exe` programs can run in Ubuntu/Linux


### Input to run
- Your `MQL4` folder => `/mt4/input`
- the `build` folder => `/mt4/output`, which will contains the `ex4` (output) and compiling `log` files

### Compiling command

#### Input: the source folder

```
find mql4-expert-advisors/Experts -type f
mql4-expert-advisors/Experts/FocusPanel.mq4

ls mql4-expert-advisors 
 Images        Libraries    Projects   'Shared Projects'
 Experts       Include      Presets     Scripts
 Files         Indicators   
```
#### Execute the command

```
docker run --rm -it -v "$PWD/mql4-expert-advisors:/mt4/input" -v "$PWD/build:/mt4/output" vuthailinh/eamt4sdk-compiler

wine: created the configuration directory '/mt4/.wine'
Could not find Wine Gecko. HTML rendering will be disabled.
wine: configuration in L"/mt4/.wine" has been updated.
output/FocusPanel.ex4
output/FocusPanel.mq4.log
```

#### Output
```
find build -type f
build/FocusPanel.ex4
build/FocusPanel.mq4.log
```
