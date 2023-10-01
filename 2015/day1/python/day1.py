"""
AoC 2015 - Day 1 - https://adventofcode.com/2015/day/1

Option 1: push/pop to a stack
Option 2: map ( and ) to +1 and -1. Accumulate value from 0

"""

import os
import sys

input_path = "../input.txt"

INSTRUCTION_MAP = {
    '(': 1,
    ')': -1,
}

def part1(instructions: str) -> int:
    return sum([INSTRUCTION_MAP[c] for c in instructions if c in INSTRUCTION_MAP.keys()])


def test_part1():
    assert(part1("()") == 0)
    assert(part1(")(") == 0)
    assert(part1("(())") == 0)
    assert(part1("()()") == 0)
    assert(part1("(((") == 3)
    assert(part1("(()(()(") == 3)
    assert(part1("))(((((") == 3)
    assert(part1("())") == -1)
    assert(part1("))(") == -1)
    assert(part1(")))") == -3)
    assert(part1(")())())") == -3)

def part2(instructions: str) -> int:
    floor = 0
    for i, c in enumerate([INSTRUCTION_MAP[c] for c in instructions if c in INSTRUCTION_MAP.keys()]):
        floor += c
        if floor == -1:
            return i + 1
    return 0

def test_part2():
    assert(part2(")") == 1)
    assert(part2("()())") == 5)
    assert(part2("()())))") == 5)

def main():
    src_dir = os.path.dirname(os.path.abspath(sys.argv[0]))
    with open(os.path.join(src_dir, input_path), "r") as f:
        instructions = f.readline()
        floor = part1(instructions)
        print(f"Part 1 answer: {floor}") # 280
        print(f"Part 2 answer: {part2(instructions)}") # 1797

if __name__ == "__main__":
    main()
