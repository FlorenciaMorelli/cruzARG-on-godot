extends Node

var file_path: String = "user://record_data.json"
var record_time: float = 0.0

func load_data():
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.ModeFlags.READ)
		if file:
			var data = file.get_as_text()
			var json = JSON.parse_string(data)
			if json:
				record_time = json.get("record_time", 0.0)
			file.close()

func save_data():
	var file = FileAccess.open(file_path, FileAccess.ModeFlags.WRITE)
	if file:
		var data = {
			"record_time": record_time
		}
		file.store_string(JSON.stringify(data))
		file.close()
