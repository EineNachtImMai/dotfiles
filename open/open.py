#!/bin/python3

import os
import sys

homedir = "/home/blackstar"
with open(f"{homedir}/.config/open/open.conf") as file:
    lines = file.readlines()
    linestoremove = []


for line in range(len(lines)):
    if lines[line][0] == "#":
        linestoremove.append(line)
for line in linestoremove[::-1]:
    lines.pop(line)

strippedlines = [line.strip() for line in lines]
# print(strippedlines)

commands={}

for line in strippedlines:
    extension, command = line.split(":")
    # print(extension, command)
    commands[extension] = command

# print(commands)

if sys.argv[1]:
    files = sys.argv[1:]
    filenames = [str(file) for file in files]

    filecommands = []

    for file in filenames:
        fileext = file.split(".")[-1]

        if fileext in commands and commands[fileext] not in filecommands:
            filecommands.append(commands[fileext])
        elif fileext not in commands:
            print("no command defined for opening this extension. defaulting to lvim.")
            filecommands.append("lvim")

    if len(filecommands) > 1:
        print("can't open files that need different progams at the same time")
    else:
        os.system(f"{filecommands[0]} {str(files).replace(",", "")[1:-1]} & disown")
