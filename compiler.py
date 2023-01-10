import sys

instructions = [
  # op
  # '100000 11110 11010 11011 00000 000000',
  # '000000 11110 11010 11011 00000 000000', 
  # '000000 11110 11010 11011 00000 000001', 
  '000000 00000 00000 00000 00010 001111', # = 143
  '000000 00000 00000 00000 00001 000101', # = 69
  '000000 00000 00000 00000 00110 100100', # = 420
  '000000 00000 00000 00000 00000 000101'  # = 5
]

compiled = ""

for instruction in instructions:
  instruction = instruction.replace(" ", "")
  hd = (len(instruction) + 3) // 4
  x = '%.*x' % (hd, int('0b'+instruction, 0))
  compiled_instruction = "".join(reversed([x[i:i+2] for i in range(0, len(x), 2)]))
  compiled += compiled_instruction + "\n"

f = open(sys.argv[1], "w")
f.write(f"{compiled}")
f.close()
