import os
import sys

component = sys.argv[1]
component_folder = f'./component_files/{component}/'

os.system(f'iverilog -I {component_folder} -o {component_folder}a.out {component_folder}{component}_tb.v')
os.system(f'vvp {component_folder}a.out')
if(sys.argv[2] == 'macos'):
    os.system(f'open -a gtkwave {component_folder}{component}_tb.vcd')
else:
    os.system(f'gtkwave {component_folder}{component}_tb.vcd')
