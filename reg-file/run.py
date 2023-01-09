import os
import sys

os.system(f'iverilog {sys.argv[1]}.v')
os.system(f'vvp a.out')
if(sys.argv[2] == 'macos'):
    os.system(f'open -a gtkwave {sys.argv[1]}.vcd')
else:
    os.system('gtkwave {sys.argv[1].vcd}')
