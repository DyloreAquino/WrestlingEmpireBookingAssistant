extends Button
class_name NewParticipantButton

var list_label_entry = preload("res://list_label_entry.tscn")
@export var character_select_menu : SelectMenu
@export var main_container : Control
@export var lower_buttons : Control

func _on_button_up():
	switch_menus()
	character_select_menu.selected.connect(_on_character_select_menu_selected)

func switch_menus():
	character_select_menu.visible = main_container.visible
	main_container.visible = !character_select_menu.visible
	lower_buttons.visible = !lower_buttons.visible

func _on_character_select_menu_selected(character_id):
	var selection = character_id
	var character = CharacterDataManager.get_character(character_id)
	var label = character["first_name"] + " " + character["last_name"]
	
	add_new_list_label_entry(label, selection)
	switch_menus()
	character_select_menu.selected.disconnect(_on_character_select_menu_selected)

func add_new_list_label_entry(label, selection):
	var new_list_label_entry : ListLabelEntry = list_label_entry.instantiate()
	new_list_label_entry.label = label
	new_list_label_entry.selection = selection
	get_parent().add_child(new_list_label_entry)
	get_parent().move_child(new_list_label_entry, self.get_index())
