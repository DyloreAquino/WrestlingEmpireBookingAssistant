extends Control

var match_list_entry_scene = preload("res://match_list_entry.tscn")

func _ready():
	update_match_list()

func update_match_list():
	var matches = MatchDataManager.matches
	
	for c in $ScrollContainer/VBoxContainer.get_children():
		c.queue_free()
	
	for match in matches:
		var new_match_list_entry : MatchListEntry = match_list_entry_scene.instantiate()
		new_match_list_entry.populate_labels(
			matches[match]['participants'],
			matches[match]['stipulations'],
			matches[match]['championships'],
			matches[match]['show_id']
		)
		$ScrollContainer/VBoxContainer.add_child(new_match_list_entry)
