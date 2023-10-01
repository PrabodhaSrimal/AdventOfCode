package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestPart1(t *testing.T) {
	assert := assert.New(t)

	assert.Equal(part1([]byte("()")), 0)
	assert.Equal(part1([]byte(")(")), 0)
	assert.Equal(part1([]byte("(())")), 0)
	assert.Equal(part1([]byte("()()")), 0)
	assert.Equal(part1([]byte("(((")), 3)
	assert.Equal(part1([]byte("(()(()(")), 3)
	assert.Equal(part1([]byte("))(((((")), 3)
	assert.Equal(part1([]byte("())")), -1)
	assert.Equal(part1([]byte("))(")), -1)
	assert.Equal(part1([]byte(")))")), -3)
	assert.Equal(part1([]byte(")())())")), -3)
}

func TestPart2(t *testing.T) {
	assert := assert.New(t)

	assert.Equal(part2([]byte(")")), 1)
	assert.Equal(part2([]byte("()())")), 5)
	assert.Equal(part2([]byte("()())))")), 5)
}
