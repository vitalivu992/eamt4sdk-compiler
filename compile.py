import os, sys
from os import walk
import subprocess

os.environ['WINE']='-all'
wine_env = os.environ.copy()

def run_commands(args, shell=True, log=True):
    pipe = subprocess.Popen(args, shell=shell, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=wine_env)
    result = pipe.communicate()
    print("SUBPROC: EXEC ::", args)
    print("SUBPROC: RETN ::", pipe.returncode)
    if log:
        if pipe.returncode == 0:
            for line in result[0].decode(encoding='utf-8').split('\n'):
                print("SUBPROC: OUT ::", line)
        else:
            for line in result[1].decode(encoding='utf-8').split('\n'):
                print("SUBPROC: ERR ::", line)
    
run_commands(['wine --version'])
run_commands(['wine /mt4/sdk/metaeditor.exe'], log=False)

for source_dir in ["Experts", "Scripts"]:
    source_file_names = []
    sdir = os.path.join("input", source_dir)
    for (root, dirs, fnames) in walk(sdir):    
        for fname in fnames:
            if 'ex4' in fname or 'log' in fname:
                os.remove(os.path.join(sdir, fname))
                continue
            source_file_names.append(fname)
    for source_file_name in source_file_names:
        with open(os.path.join(sdir, source_file_name), 'r') as file:
            print("*** Compiling:", file.name, "***")
            run_commands(['wine /mt4/sdk/metaeditor.exe /compile:' + file.name + ' /include:input /log:'+file.name+'.log'])
            
            if os.path.exists(file.name+'.log'): # compile success
                with open(file.name+'.log', encoding='utf-16') as log:
                    for line in log.readlines():
                        if line.startswith('Result'):
                            print(line)
                            words = line.split()
                            if int(words[1]) > 0:
                                print(">>> Compile failed ", file.name)
                                sys.exit(1)

for source_dir in ["Experts", "Scripts"]:
    source_file_names = []
    sdir = os.path.join("input", source_dir)
    for (root, dirs, fnames) in walk(sdir):    
        for fname in fnames:
            if 'ex4' in fname:
                print("+++ Found binary", os.path.join(sdir, fname))