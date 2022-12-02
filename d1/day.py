#!/usr/bin/env python3
import os

elfs = []

with open("input.txt") as file:
    elf_inv_temp = 0
    for line in file:
        if line == "\n":
            elfs.append(elf_inv_temp)
            elf_inv_temp = 0
            continue
        elf_inv_temp += int(line)

print(f"Max: {max(elfs)} \nLen: {len(elfs)}")
