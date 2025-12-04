extends Control

var match_list_entry_scene = preload("res://match_list_entry.tscn")

@export var main_cont : Control
@export var main_vbox : VBoxContainer
@export var create_match_view : Control
@export var main_buttons_cont : Control

func _ready():
	update_list()

func update_list():
	MatchDataManager.load_json()
	var matches = MatchDataManager.matches
	
	for c in main_vbox.get_children():
		if c is not Button:
			c.queue_free()
	
	var keys = matches.keys()
	keys.reverse()
	for match_id in keys:
		var new_match_list_entry : MatchListEntry = match_list_entry_scene.instantiate()
		new_match_list_entry.match_id = match_id
		new_match_list_entry.populate_labels(
			matches[match_id]['title'],
			matches[match_id]['participants'],
			matches[match_id]['stipulations'],
			matches[match_id]['championships'],
		)
		main_vbox.add_child(new_match_list_entry)

func _on_button_button_up():
	main_cont.visible = false
	main_buttons_cont.visible = false
	create_match_view.visible = true
