extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_victory_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/scenes/main_level.tscn")


func _on_victory_exit_pressed() -> void:
	get_tree().quit()
