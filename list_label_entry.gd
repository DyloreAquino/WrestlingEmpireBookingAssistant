extends HBoxContainer
class_name ListLabelEntry

var color = Color.DIM_GRAY
var selection = null
var label = ""

func _ready():
	$Label.text = label
	$Label.add_theme_color_override("font_outline_color", color)

func _on_delete_entry_button_up():
	var top = get_parent().get_child(get_index()-1)
	var bottom = get_parent().get_child(get_index()+1)
	if top is Label and top.text == "VS." and bottom is NewParticipantButton:
		top.queue_free()
		bottom.queue_free()
	queue_free()
