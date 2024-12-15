extends Node
class_name Stopwatch

var time = 0.0
var stopped = false

func _process(delta: float) -> void:
	if stopped :
		return
	time += delta

func reset():
	time = 0.0

func time_to_string() -> String:
	#	Turn time var into string for UI display
	var msec = fmod(time, 1) * 1000
	var sec = fmod(time, 60)
	var min = time / 60
	#	Format time to look like 00 : 00 : 000
	var format_string = "%02d : %02d : %02d"
	var actual_String = format_string % [min, sec, msec]
	return actual_String
