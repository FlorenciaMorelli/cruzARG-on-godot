extends CharacterBody2D

@export var speed = 250
var motion = Vector2()

func _physics_process(delta):

	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	if Input.is_action_pressed("ui_up"):
		motion.y = -speed
	if Input.is_action_pressed("ui_down"):
		motion.y = speed
