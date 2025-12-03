extends HBoxContainer
class_name ListLabelEntry

var selection = null
var label = ""

func _ready():
	$Label.text = label
	
func _on_delete_entry_button_up():
	var top = get_parent().get_child(get_index()-1)
	var bottom = get_parent().get_child(get_index()+1)
	if top is Label and top.text == "VS." and bottom is NewParticipantButton:
		top.queue_free()
		bottom.queue_free()
	queue_free()
