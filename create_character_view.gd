extends Control

@export var first_name : LineEdit
@export var last_name : LineEdit

@export var gender_option : OptionButton
@export var alignment_option : OptionButton
@export var injured_check : CheckBox

@export var friends_input : VBoxContainer
@export var rivals_input : VBoxContainer
@export var teammates_input : VBoxContainer

func reset_inputs():
	first_name.text = ""
	last_name.text = ""
	
	gender_option.selected = 0
	alignment_option.selected = 0
	injured_check.button_pressed = false
	
	var inputs = [friends_input, rivals_input, teammates_input]
	for input in inputs:
		for child in input.get_children():
			if child is not Button:
				child.queue_free()

func go_back():
	self.visible = false
	self.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	get_parent().get_node_or_null("MainContainer").visible = true
	get_parent().get_parent().get_node_or_null("MainButtonsContainer").visible = true
	
	get_parent().update_list()

func save_entry():
	var new_char = CharacterDataManager.new_character_template()
	
	var friends = []
	var rivals = []
	var teammates = []
	
	new_char["first_name"] = first_name.text
	new_char["last_name"] = last_name.text
	
	new_char["gender"] = gender_option.get_item_text(gender_option.selected)
	new_char["alignment"] = alignment_option.get_item_text(alignment_option.selected)
	
	new_char["injured"] = injured_check.button_pressed
	
	for friend in friends_input.get_children():
		if friend is ListLabelEntry:
			friends.append(friend.selection)
	
	new_char["friends"] = friends
	
	for rival in rivals_input.get_children():
		if rival is ListLabelEntry:
			rivals.append(rival.selection)
	
	new_char["rivals"] = rivals
	
	for teammate in teammates_input.get_children():
		if teammate is ListLabelEntry:
			teammates.append(teammate.selection)
	
	new_char["teammates"] = teammates
	
	CharacterDataManager.add(new_char)

func _on_back_button_up():
	go_back()

func _on_save_button_up():
	save_entry()
	reset_inputs()
	go_back()

func _on_discard_button_up():
	reset_inputs()
	go_back()
