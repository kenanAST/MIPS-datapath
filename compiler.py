import sys

instructions = [
  '00000000 00000000 00000000 10001111',
  '00000000 00000000 00000000 11010110'
]

compiled = ""



for instruction in instructions:
  instruction = instruction.replace(" ", "")
  hd = (len(instruction) + 3) // 4
  x = '%.*x' % (hd, int('0b'+instruction, 0))
  compiled_instruction = "".join(reversed([x[i:i+2] for i in range(0, len(x), 2)]))
  compiled += compiled_instruction + "\n"

f = open(f"{sys.argv[1]}", "w")
f.write(f"{compiled}")
f.close()
