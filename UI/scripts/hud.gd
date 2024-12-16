extends CanvasLayer

var time_elapsed: float = 0.0
var is_timer_active: bool = true

@onready var stopwatch_label : Label = $HUD_Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DataManager.load_data()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_timer_active : 
		time_elapsed += delta
		stopwatch_label.text = "Tiempo: %.2f s" % time_elapsed
		GameManager.final_time = time_elapsed
