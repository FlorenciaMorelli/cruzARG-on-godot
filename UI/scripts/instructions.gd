extends Node2D

@onready var back_button : Button = $Back

func _ready() -> void:
	back_button.modulate = Color(0.647059, 0.164706, 0.164706, 1)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("select") : 
		_on_back_pressed()
	
	if Input.is_action_just_pressed("back") : 
		_on_back_pressed()
	
	if Input.is_action_just_pressed("exit") : 
		get_tree().quit()

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/scenes/menu.tscn")
