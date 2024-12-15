extends Node2D

var ball_scene = preload("res://pick-ups/scenes/football.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_ball()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_ball():
	var ball = ball_scene.instantiate()
	add_child(ball)
