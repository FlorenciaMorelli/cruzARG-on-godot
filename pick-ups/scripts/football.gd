extends RigidBody2D

#	Viewport size
var viewport_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_size = get_viewport_rect().size
	position = get_random_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_random_position() -> Vector2:
	#	Define ranges
	var min_y = 0  #	Top viewport limit
	var max_y = viewport_size.y / 13  #	Bottom limit for the ball to appear
	var random_x = randf_range(0, viewport_size.x)  #	Viewports full width
	var random_y = randf_range(min_y, max_y)
	return Vector2(random_x, random_y)
