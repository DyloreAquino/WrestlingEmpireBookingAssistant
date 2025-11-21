extends Node

func load_json(path: String) -> Variant:
	if not FileAccess.file_exists(path):
		return null
	var file = FileAccess.open(path, FileAccess.READ)
	var parsed = JSON.parse_string(file.get_as_text())
	return parsed

func save_json(path: String, data: Variant) -> void:
	var text = JSON.stringify(data, "\t")
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(text)

func generate_new_id(database) -> int:
	if database.keys().is_empty():
		return 1
	var ids = []
	for id in database.keys():
		ids.append(int(id))
	return ids.max() + 1
