extends CharacterBody2D

const SPEED = 100

func get_x_dir():
	return Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

func _physics_process(delta):
	var dir = Vector2(get_x_dir(),0)
	velocity = dir * SPEED
	move_and_slide()
	position.y = 130
