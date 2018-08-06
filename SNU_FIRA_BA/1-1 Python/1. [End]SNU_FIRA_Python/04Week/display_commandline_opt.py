import sys

print(sys.argv)

if len(sys.argv) != 2 or sys.argv[1] == '-help':
    print('usage: python display_commandline_opt.py filname')
    sys.exit()

with open(sys.argv[1], encoding='utf-8') as file:
    lines = file.realines()
    for line in lines:
        print(line.rstrip())

