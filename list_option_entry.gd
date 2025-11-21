extends HBoxContainer
class_name ListOptionEntry

var options = []

func _ready():
	for option in options:
		$OptionButton.add_item(option)

func _on_delete_entry_button_up():
	queue_free()
