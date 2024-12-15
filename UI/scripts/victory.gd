extends Node2D

@onready var time_label: Label = $Victory_CanvasLayer/Victory_Control/Victory_VBoxContainer/TimeLabel
@onready var record_label: Label = $Victory_CanvasLayer/Victory_Control/Victory_VBoxContainer/RecordLabel
var record_time: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_times()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_times():
	var final_time = GameManager.final_time
	
	# Cargar el récord desde DataManager
	DataManager.load_data()
	var record_time = DataManager.record_time
	
	# Comparar y actualizar el récord
	if record_time == 0 or final_time < record_time:
		DataManager.record_time = final_time
		DataManager.save_data()
		record_label.text = "New Record! %.2f s" % final_time
	else:
		record_label.text = "Record: %.2f s" % record_time

	# Mostrar el tiempo final
	time_label.text = "Your Time: %.2f s" % final_time
