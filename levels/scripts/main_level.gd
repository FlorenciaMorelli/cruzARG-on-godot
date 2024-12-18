extends Node2D

var item_scene = preload("res://pick-ups/scenes/mate.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_item()

func _process(delta: float) -> void:
	_handle_keys()

func spawn_item():
	var victory_item = item_scene.instantiate()
	add_child(victory_item)

func _handle_keys() :
	if Input.is_action_just_pressed("exit") : 
		get_tree().change_scene_to_file("res://UI/scenes/menu.tscn")
