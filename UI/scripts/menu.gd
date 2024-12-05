extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	# TO DO: emit_signal("cambio_escena")
	pass


func _on_exit_pressed() -> void:
	get_tree().quit()
