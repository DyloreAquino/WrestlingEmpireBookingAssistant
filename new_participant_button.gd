extends Button
class_name NewParticipantButton

var list_label_entry = preload("res://list_label_entry.tscn")
@onready var character_select_menu = $"../../../../../CharacterSelectMenu"
@onready var main_container = $"../../../.."
@onready var lower_buttons = $"../../../../../LowerButtons"

func _on_button_up():
	switch_menus()
	character_select_menu.selected.connect(_on_character_select_menu_selected)
	character_select_menu.list_of_chars.clear()
	var list_of_children = get_parent().get_children()
	for c in list_of_children:
		if c is ListLabelEntry:
			character_select_menu.list_of_chars.append(c.label)
	character_select_menu.populate_buttons()

func switch_menus():
	character_select_menu.visible = main_container.visible
	main_container.visible = !character_select_menu.visible
	lower_buttons.visible = !lower_buttons.visible

func _on_character_select_menu_selected(character_id):
	var selection = character_id
	var character = CharacterDataManager.get_character(character_id)
	var label = character["first_name"] + " " + character["last_name"]
	var color = get_color(character["gender"], character["alignment"])
	
	add_new_list_label_entry(color, label, selection)
	switch_menus()
	character_select_menu.selected.disconnect(_on_character_select_menu_selected)

func add_new_list_label_entry(color, label, selection):
	var new_list_label_entry : ListLabelEntry = list_label_entry.instantiate()
	new_list_label_entry.color = color
	new_list_label_entry.label = label
	new_list_label_entry.selection = selection
	get_parent().add_child(new_list_label_entry)
	get_parent().move_child(new_list_label_entry, self.get_index())

func get_color(gender, alignment):
	if alignment == "Face":
		if gender == "Female":
			return Color.PALE_VIOLET_RED
		return Color.SEA_GREEN
	elif alignment == "Heel":
		if gender == "Female":
			return Color.FIREBRICK
		return Color.REBECCA_PURPLE
	elif alignment == "Referree":
		return Color.DIM_GRAY
	elif alignment == "Booker":
		return Color.BLACK
