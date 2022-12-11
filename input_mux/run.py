import os
import sys

os.system(f'iverilog {sys.argv[1]}.v')
os.system(f'vvp a.out')
os.system(f'gtkwave {sys.argv[1]}.vcd')
