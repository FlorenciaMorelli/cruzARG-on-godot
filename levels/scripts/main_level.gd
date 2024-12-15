extends Node2D

var item_scene = preload("res://pick-ups/scenes/mate.tscn")

var time_elapsed: float = 0.0
var is_timer_active: bool = true

@onready var stopwatch_label : Label = $StopwatchLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_item()
	DataManager.load_data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_timer_active : 
		time_elapsed += delta
		stopwatch_label.text = "Time: %.2f s" % time_elapsed
		GameManager.final_time = time_elapsed

	
func spawn_item():
	var victory_item = item_scene.instantiate()
	add_child(victory_item)
