extends Control

@export var title_input : LineEdit
@export var participant_input : Control
@export var match_type_option : OptionButton
@export var stipulation_input : Control
@export var championship_input : Control

func reset_inputs():
	var inputs = [participant_input, stipulation_input, championship_input]
	for input in inputs:
		for child in input.get_children():
			if child is not Button and child is not Label:
				child.queue_free()
	for c in participant_input.get_children():
		c.queue_free()
	var new_part_but = preload("res://new_participant_button.tscn").instantiate()
	var new_enemy_but = preload("res://new_enemy_button.tscn").instantiate()
	title_input.text = ""
	participant_input.add_child(new_part_but)
	participant_input.add_child(new_enemy_but)
	match_type_option.selected = 0

func go_back():
	self.visible = false
	self.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	get_parent().get_node_or_null("MainContainer").visible = true
	get_parent().get_parent().get_node_or_null("MainButtonsContainer").visible = true
	
	get_parent().update_list()

func save_entry():
	var new_match = MatchDataManager.new_match_template()
	
	new_match["title"] = title_input.text
	
	var participants = []
	var team = []
	for participant_entry in participant_input.get_children():
		if participant_entry is ListLabelEntry:
			team.append(participant_entry.selection)
		elif participant_entry is Button:
			if team:
				participants.append(team.duplicate())
			team.clear()
	
	new_match["participants"] = participants
	
	new_match["match_type"] = match_type_option.get_item_text(match_type_option.selected)
	
	var stipulations = []
	for stipulation_entry in stipulation_input.get_children():
		if stipulation_entry is ListOptionEntry:
			stipulations.append(stipulation_entry.selection)
	
	new_match["stipulations"] = stipulations
	
	var championships = []
	for championship_entry in championship_input.get_children():
		if championship_entry is ListOptionEntry:
			championships.append(championship_entry.selection)
	
	new_match["championships"] = championships
	
	MatchDataManager.add(new_match)

func _on_back_button_up():
	go_back()

func _on_save_button_up():
	save_entry()
	reset_inputs()
	go_back()

func _on_discard_button_up():
	reset_inputs()
	go_back()
