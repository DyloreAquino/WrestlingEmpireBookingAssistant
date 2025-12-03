extends Control

var character_list_entry_scene = preload("res://character_list_entry.tscn")

@export var main_cont : Control
@export var main_vbox : VBoxContainer
@export var create_character_view : Control
@export var main_buttons_cont : Control

func _ready():
	update_list()

func update_list():
	CharacterDataManager.load_json()
	var characters = CharacterDataManager.characters
	
	for c in main_vbox.get_children():
		if c is not Button:
			c.queue_free()
	
	var keys = characters.keys()
	keys.reverse()
	for character_id in keys:
		var new_character_list_entry : CharacterListEntry = character_list_entry_scene.instantiate()
		new_character_list_entry.character_id = character_id
		new_character_list_entry.populate_labels(
			characters[character_id]['first_name'],
			characters[character_id]['last_name'],
			characters[character_id]['gender'],
			characters[character_id]['alignment'],
		)
		main_vbox.add_child(new_character_list_entry)

func _on_button_button_up():
	main_cont.visible = false
	main_buttons_cont.visible = false
	create_character_view.visible = true
