extends Area2D

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
	var random_x = randf_range(0, viewport_size.x)  #	Viewports full width
	return Vector2(random_x, 16)


func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		queue_free()
		print("Messi tocó la pelota")
