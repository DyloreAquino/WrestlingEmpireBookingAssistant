extends ListLabelEntry
class_name MatchListLabelEntry

var type_ : String = "Main"

func _ready():
	super._ready()
	if type_ == "Main":
		$Label.add_theme_color_override("font_color", Color.DARK_GOLDENROD)
	elif type_ == "Semi-Main":
		$Label.add_theme_color_override("font_color", Color.MEDIUM_VIOLET_RED)
	elif type_ == "Mid":
		$Label.add_theme_color_override("font_color", Color.SKY_BLUE)
	elif type_ == "Under":
		$Label.add_theme_color_override("font_color", Color.SEA_GREEN)

func _on_delete_entry_button_up():
	var new_match_button_scene := load("res://new_match_button.tscn")
	var new_match_button = new_match_button_scene.instantiate()
	new_match_button.text = type_
	get_parent().add_child(new_match_button)
	get_parent().move_child(new_match_button, get_index())
	queue_free()
