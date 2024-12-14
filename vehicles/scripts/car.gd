extends RigidBody2D

# Speed in pixels/sec
@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_collide(Vector2(speed, 0))


func _on_screen_exited() -> void:
	global_position.x = get_parent().global_position.x
