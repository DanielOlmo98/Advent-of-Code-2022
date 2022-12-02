#!/usr/bin/env python3
elfs = []

with open("input.txt") as file:
    elf_inv_temp = 0
    for line in file:
        if line == "\n":
            elfs.append(elf_inv_temp)
            elf_inv_temp = 0
            continue
        elf_inv_temp += int(line)

elfs.sort()
print(f"Top 5: {elfs[-5:]} \nLen: {len(elfs)}")
print(f"Top 3 combined: {sum(elfs[-3:])}")
