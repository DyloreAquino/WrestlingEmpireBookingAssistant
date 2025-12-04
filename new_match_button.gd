extends Button
class_name NewMatchButton

@onready var match_select_menu = $"../../../../../MatchSelectMenu"
@onready var main_container = $"../../../.."
@onready var lower_buttons = $"../../../../../LowerButtons"

func _ready():
	if text == "Main":
		add_theme_color_override("font_color", Color.DARK_GOLDENROD)
	elif text == "Semi-Main":
		add_theme_color_override("font_color", Color.MEDIUM_VIOLET_RED)
	elif text == "Mid":
		add_theme_color_override("font_color", Color.SKY_BLUE)
	elif text == "Under":
		add_theme_color_override("font_color", Color.SEA_GREEN)

func _on_button_up():
	switch_menus()
	match_select_menu.selected.connect(_on_match_select_menu_selected)

func switch_menus():
	match_select_menu.visible = main_container.visible
	main_container.visible = !match_select_menu.visible
	lower_buttons.visible = !lower_buttons.visible
	match_select_menu.populate_buttons()

func _on_match_select_menu_selected(match_id):
	var selection = match_id
	var match_ = MatchDataManager.get_match(match_id)
	var label = ""
	if match_["title"] == "":
		label = format_participants(match_["participants"])
	else:
		label = match_["title"]
	
	add_new_list_label_entry(label, selection)
	switch_menus()
	match_select_menu.selected.disconnect(_on_match_select_menu_selected)

func format_participants(participants : Array):
	var names = []
	for team in participants:
		var team_names = []
		for character_id in team:
			var character_name = CharacterDataManager.get_character(character_id)["last_name"]
			if character_name != "":
				team_names.append(character_name)
			else:
				character_name = CharacterDataManager.get_character(character_id)["first_name"]
				team_names.append(character_name)
		names.append(team_names)
	var result = []
	for team in names:
		result.append(", ".join(team))
	return " VS. ".join(result)

func add_new_list_label_entry(label, selection):
	var match_list_label_entry_scene = load("res://match_list_label_entry.tscn")
	var new_list_label_entry : MatchListLabelEntry = match_list_label_entry_scene.instantiate()
	new_list_label_entry.type_ = self.text
	new_list_label_entry.label = label
	new_list_label_entry.selection = selection
	get_parent().add_child(new_list_label_entry)
	get_parent().move_child(new_list_label_entry, self.get_index())
	queue_free()
