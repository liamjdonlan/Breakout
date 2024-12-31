extends Node

var highest_score = 0
var previous_score = 0

func update_scores(score):
	previous_score = score
	if score > highest_score:
		highest_score = score
