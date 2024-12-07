extends CharacterBody2D

# speed in pixels/sec
var speed = 300 

func _physics_process(delta):
	#	Get direction of movement
	var direction = Input.get_vector("left", "right", "up", "down")

	# Stop diagonal movement by listening for input then setting axis to zero
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		direction.y = 0
	elif Input.is_action_pressed("up") || Input.is_action_pressed("down"):
		direction.x = 0
	else:
		direction = Vector2.ZERO
	
	#	Normalize directional movement
	direction = direction.normalized()
	
	#	Setup the movement
	velocity = (direction * speed)
	move_and_slide()
