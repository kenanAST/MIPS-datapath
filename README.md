# Single Cyle Mips Datapath Verilog Implementation

This repository contains a Verilog implementation of a MIPS datapath. The datapath is a structural representation of the MIPS processor, including the registers, the ALU, and the control unit.

## Features

- 32 registers
- Arithmetic and logical operations in the ALU
- Control unit for executing instructions

<img src="https://i.imgur.com/GL7WIyy.png" alt="Single Cycle Datapath" />

## Usage

To use the MIPS datapath, you will need a Verilog compiler such as [Icarus Verilog](http://iverilog.icarus.com/).

1. Clone the repository:
   `git clone https://github.com/kenanAST/MIPS-datapath.git`

2. Compile the MIPS Instructions(see compiler.py):
   `python compiler.py blank.memh`

3. Run the simulation:
   `python run.py testbench.v`

## File Structure

The repository contains the following files:

- `processor.v`: top-level module for the datapath
- `control_unit.v`: control unit for the datapath
- `alu.v`: arithmetic and logic unit for the datapath
- `reg_file.v`: register file for the datapath
- `inst_rom.v`: instruction memory for the datapath
- `input_mux.v`: parameterized mux for the 3-mux used in the datapath
- `data_memory.v` data memory for the datapath
- `compiler.py` binary instructions to hex instructions
- `blank.memh` compiled instructions used in instruction memory

## Acknowledgements

The Verilog code for the MIPS datapath is based on the [Digital Design and Computer Architecture](https://www.elsevier.com/books/digital-design-and-computer-architecture/harris/978-0-12-385471-3) textbook by David Harris and Sarah Harris.
