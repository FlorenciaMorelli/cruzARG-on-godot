extends Node2D

@onready var time_label: Label = $Victory_CanvasLayer/HBoxContainer/TimeLabel
@onready var record_label: Label = $Victory_CanvasLayer/HBoxContainer/RecordLabel
var record_time: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_times()
	$Victory_AudioStreamPlayer2D.play()


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
		record_label.modulate = Color(1.0, 0.0, 0.0, 1.0)
		record_label.text = "Nuevo Récord! %.2f s" % final_time
	else:
		record_label.text = "Récord: %.2f s" % record_time

	# Mostrar el tiempo final
	time_label.text = "Tiempo: %.2f s" % final_time
