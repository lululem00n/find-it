extends Node

var leaves = 0
const TOTAL_LEAVES = 5

signal leaves_changed(current, total)
signal game_won

func collect_leaf():
	leaves += 1
	leaves_changed.emit(leaves, TOTAL_LEAVES)

	if leaves >= TOTAL_LEAVES:
		game_won.emit()

func reset():
	leaves = 0
	leaves_changed.emit(leaves, TOTAL_LEAVES)
