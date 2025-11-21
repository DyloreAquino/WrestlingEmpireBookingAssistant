extends Button
class_name NewListOptionButton

var list_option_entry : PackedScene

func _on_button_up():
	var new_list_option_entry = list_option_entry.instantiate()
	$"..".add_child(new_list_option_entry)
	$"..".move_child(new_list_option_entry, get_index())
