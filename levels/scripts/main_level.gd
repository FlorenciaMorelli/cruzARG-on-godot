extends Node2D

var item_scene = preload("res://pick-ups/scenes/mate.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_item()


func spawn_item():
	var victory_item = item_scene.instantiate()
	add_child(victory_item)
