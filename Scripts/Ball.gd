extends CharacterBody2D

var speed = 0.7
signal level_1_brick_destroyed
signal level_2_brick_destroyed
signal level_3_brick_destroyed
var rng = RandomNumberGenerator.new()

func regulate_velocity():
	if velocity.y < 0:
		velocity = Vector2(velocity.x, clamp(velocity.y, -1, -0.25)).normalized() * speed
	else:
		velocity = Vector2(velocity.x, clamp(velocity.y, 0.25,1)).normalized() * speed

func initialize_velocity():
	rng.randomize()
	velocity = Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, -0.25)).normalized()

func _ready():
	initialize_velocity()

func _physics_process(delta):
	velocity = velocity.normalized() * speed
	regulate_velocity()
	var col = move_and_collide(velocity)
	if col:
		$BounceSound.play()
		print(speed)
		var normal = col.get_normal()
		velocity = velocity.bounce(normal)
		var collided_body = col.get_collider()
		if collided_body.is_in_group("Brick"):
			speed += 0.02
			collided_body.queue_free()
			if collided_body.is_in_group("Level 1"):
				emit_signal("level_1_brick_destroyed")
			if collided_body.is_in_group("Level 2"):
				emit_signal("level_2_brick_destroyed")
			if collided_body.is_in_group("Level 3"):
				emit_signal("level_3_brick_destroyed")

func _on_bottom_barrier_body_entered(body):
	position = Vector2(120, 100)
	initialize_velocity()
