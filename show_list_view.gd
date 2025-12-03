extends Control

var show_list_entry_scene = preload("res://show_list_entry.tscn")

@export var main_cont : Control
@export var main_vbox : VBoxContainer
@export var create_show_view : Control
@export var main_buttons_cont : Control

func _ready():
	update_list()

func update_list():
	ShowDataManager.load_json()
	var shows = ShowDataManager.shows
	
	for c in main_vbox.get_children():
		if c is not Button:
			c.queue_free()
	
	var keys = shows.keys()
	keys.reverse()
	for show_id in keys:
		var new_show_list_entry : ShowListEntry = show_list_entry_scene.instantiate()
		new_show_list_entry.show_id = show_id
		new_show_list_entry.populate_labels(
			shows[show_id]['title'],
			shows[show_id]['schedule'],
			shows[show_id]['type'],
		)
		main_vbox.add_child(new_show_list_entry)

func _on_button_button_up():
	main_cont.visible = false
	main_buttons_cont.visible = false
	create_show_view.visible = true
