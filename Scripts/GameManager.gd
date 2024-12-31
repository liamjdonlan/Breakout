extends Node

var lives = 3
var score = 0

func check_for_win():
	if score >= 19800:
		get_tree().change_scene_to_file("res://Scenes/Victory.tscn")

func _ready():
	get_parent().get_node("Lives").text = "Lives " + str(lives)
	get_parent().get_node("Score").text = "Score " + str(score)

func _on_ball_level_1_brick_destroyed():
	score += 100
	get_parent().get_node("Score").text = "Score " + str(score)

func _on_ball_level_2_brick_destroyed():
	score += 300
	get_parent().get_node("Score").text = "Score " + str(score)

func _on_ball_level_3_brick_destroyed():
	score += 500
	get_parent().get_node("Score").text = "Score " + str(score)

func _on_bottom_barrier_body_entered(body):
	lives -= 1
	if lives < 1:
		ScoreTracker.update_scores(score)
		get_tree().change_scene_to_file("res://Scenes/GameOverMenu.tscn")
	$LifeLossSound.play()
	get_parent().get_node("Lives").text = "Lives " + str(lives)
