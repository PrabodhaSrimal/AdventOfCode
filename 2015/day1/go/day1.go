package main

import (
	"fmt"
	"os"
)

const inputPath string = "../input.txt"

func part1(instructions []byte) int {
	floor := 0
	for _, c := range instructions {
		if c == '(' {
			floor++
		} else if c == ')' {
			floor--
		}
	}
	return floor
}

func part2(instructions []byte) int {
	floor := 0
	for i, c := range instructions {
		if c == '(' {
			floor++
		} else if c == ')' {
			floor--
		}

		if floor == -1 {
			return i + 1
		}
	}
	return 0
}

func main() {
	data, e := os.ReadFile(inputPath)
	if e != nil {
		fmt.Println(e)
		return
	}
	fmt.Println("Part 1 answer:", part1(data))
	fmt.Println("Part 2 answer:", part2(data))
}
