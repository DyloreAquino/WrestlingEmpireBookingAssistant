extends Control

@export var title_input : LineEdit
@export var week_input : OptionButton
@export var month_input : OptionButton
@export var type_input : OptionButton
@export var matches_input : VBoxContainer

var ppv_matches = ["Main", "Semi-Main", "Semi-Main", "Mid", "Mid", "Mid", "Under", "Under", "Under", "Under"]
var tv_matches = ["Main", "Mid", "Mid", "Under", "Under", "Under"]

func _ready():
	reset_inputs()

func reset_inputs():
	title_input.text = ""
	week_input.selected = 0
	month_input.selected = 0
	type_input.selected = 0
	populate_match_entries()
	## TODO: Matches reset not implemented yet

func go_back():
	self.visible = false
	self.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	get_parent().get_node_or_null("MainContainer").visible = true
	get_parent().get_parent().get_node_or_null("MainButtonsContainer").visible = true
	
	get_parent().update_list()

func save_entry():
	var new_show = ShowDataManager.new_show_template()
	
	new_show["title"] = title_input.text
	new_show["schedule"]["week"] = week_input.get_item_text(week_input.selected)
	new_show["schedule"]["month"] = month_input.get_item_text(month_input.selected)
	new_show["type"] = type_input.get_item_text(type_input.selected)
	
	## TODO: Matches saving not implemented yet
	
	ShowDataManager.add(new_show)

func _on_back_button_up():
	go_back()

func _on_save_button_up():
	save_entry()
	reset_inputs()
	go_back()

func _on_discard_button_up():
	reset_inputs()
	go_back()

func populate_match_entries():
	for c in matches_input.get_children():
		c.queue_free()
	
	var match_list = []
	if type_input.get_item_text(type_input.selected) == "PPV":
		match_list = ppv_matches
	else:
		match_list = tv_matches
	
	for match_ in match_list:
		var new_match_button_scene = load("res://new_match_button.tscn")
		var new_match_button : NewMatchButton = new_match_button_scene.instantiate()
		new_match_button.text = match_
		matches_input.add_child(new_match_button)

func _on_type_option_item_selected(_index):
	populate_match_entries()
