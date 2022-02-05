import os, sys
import re
from os import walk
import subprocess

experts = []
for (_, _, fnames) in walk("/mt4/input/Experts"):
    for fname in fnames:
        if 'ex4' in fname or 'log' in fname:
            continue
        experts.append(fname)

print("EA list:", experts)
os.environ['WINE']='-all'
wine_env = os.environ.copy()

def run_commands(args, shell=True):
    pipe = subprocess.Popen(args, shell=shell, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=wine_env)
    result = pipe.communicate()
    print("SUBPROC: EXEC ::", args)
    print("SUBPROC: RETN ::", pipe.returncode)
    if pipe.returncode == 0:
        for line in result[0].decode(encoding='utf-8').split('\n'):
            print("SUBPROC: OUT ::", line)
    else:
        for line in result[1].decode(encoding='utf-8').split('\n'):
            print("SUBPROC: ERR ::", line)
    

# run_commands(['wine --version'])


for expert in experts:
    with open(os.path.join("input/Experts", expert), 'r') as file:
        print("***** Compiling EA:", file.name, "*****")
        run_commands(['wine /mt4/sdk/metaeditor.exe /compile:' + file.name + '/include:input'])