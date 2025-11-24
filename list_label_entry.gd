extends HBoxContainer
class_name ListLabelEntry

var selection = null
var label = ""

func _ready():
	$Label.text = label
	
func _on_delete_entry_button_up():
	queue_free()
