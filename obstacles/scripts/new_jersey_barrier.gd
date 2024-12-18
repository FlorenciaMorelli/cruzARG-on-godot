extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_collision_layer(2)  #	Scene is on layer 2
	set_collision_mask(1)  # Scene detects collisions with layer 1 (Player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
