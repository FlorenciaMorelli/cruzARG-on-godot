extends CanvasLayer

# Store the selected index
var selected_index: int = 0
@onready var play_button : Button = $Menu/VerticalContainer/Play
@onready var howtoplay_button : Button = $Menu/VerticalContainer/HowToPlay
@onready var exit_button : Button = $Menu/VerticalContainer/Exit
var menu_items = []

# Speed for selecting menu items
var move_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_items = [play_button, howtoplay_button, exit_button]
	# Set the initial selected item
	update_selected_item()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("down"):
		selected_index += move_speed
		selected_index = clamp(selected_index, 0, len(menu_items) - 1)
		update_selected_item()
		
	if Input.is_action_just_pressed("up"):
		selected_index -= move_speed
		selected_index = clamp(selected_index, 0, len(menu_items) - 1)
		update_selected_item()
	
	if Input.is_action_just_pressed("select") : 
		menu_items[selected_index].emit_signal("pressed")
	
	if Input.is_action_just_pressed("exit") : 
		get_tree().quit()

func update_selected_item():
	# Deselect all menu items
	for i in range(len(menu_items)):
		menu_items[i].modulate = Color(0.0, 0.0, 0.0, 1.0)  # Normal color
	# Select the current item
	menu_items[selected_index].modulate = Color(0.647059, 0.164706, 0.164706, 1)  # Highlight color


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/scenes/game.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/scenes/instructions.tscn")
