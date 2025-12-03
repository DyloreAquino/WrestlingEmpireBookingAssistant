extends HBoxContainer
class_name ListOptionEntry

var selection = ""
var options = []

func _ready():
	for option in options:
		$OptionButton.add_item(option)
		$OptionButton.get_popup().add_theme_font_size_override("font_size", 50)
	
	selection = $OptionButton.get_item_text(0)

func _on_delete_entry_button_up():
	if check_parent_has_entries():
		get_parent().queue_free()
	queue_free()

func check_parent_has_entries():
	var parent = get_parent()
	if parent.name != "Input":
		if not parent.has_node("ListOptionEntry"):
			return false
	return true

func _on_option_button_item_selected(index):
	selection = $OptionButton.get_item_text(index)
