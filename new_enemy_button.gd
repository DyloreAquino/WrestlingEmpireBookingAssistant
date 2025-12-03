extends Button

var participant_button = preload("res://new_participant_button.tscn")
var character_select_menu : SelectMenu
var main_container : Control
var lower_buttons : Control

func _ready():
	character_select_menu = $"../../../../../CharacterSelectMenu"
	main_container = $"../../../.."
	lower_buttons = $"../../../../../LowerButtons"

func _on_button_up():
	var label = Label.new()
	label.text = "VS."
	label.add_theme_font_size_override("font_size", 50)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	
	var new_participant_button : NewParticipantButton = participant_button.instantiate()
	new_participant_button.character_select_menu = character_select_menu
	new_participant_button.main_container = main_container
	new_participant_button.lower_buttons = lower_buttons

	get_parent().add_child(label)
	get_parent().move_child(label, get_index())
	
	get_parent().add_child(new_participant_button)
	get_parent().move_child(new_participant_button, get_index())
