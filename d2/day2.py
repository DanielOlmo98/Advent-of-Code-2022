#!/usr/bin/env python3

res = {
    "A": {"X": 1 + 3, "Y": 2 + 6, "Z": 3 + 0},
    "B": {"X": 1 + 0, "Y": 2 + 3, "Z": 3 + 6},
    "C": {"X": 1 + 6, "Y": 2 + 0, "Z": 3 + 3},
}

res2 = {
    "A": {"X": 3 + 0, "Y": 1 + 3, "Z": 2 + 6},
    "B": {"X": 1 + 0, "Y": 2 + 3, "Z": 3 + 6},
    "C": {"X": 2 + 0, "Y": 3 + 3, "Z": 1 + 6},
}

if __name__ == "__main__":
    with open("input.txt") as file:
        score = 0
        score2 = 0
        for line in file:
            score += res[line[0]][line[2]]
            score2 += res2[line[0]][line[2]]

    print(score)
    print(score2)
