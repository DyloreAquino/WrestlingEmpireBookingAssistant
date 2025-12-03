extends Control
class_name CharacterListEntry

@export var button : Button

var character_id = null

func populate_labels(first_name, last_name, gender, alignment):
	button.text = format_name(first_name, last_name)
	var new_style_box = StyleBoxFlat.new()
	new_style_box.bg_color = get_color(gender, alignment)
	add_theme_stylebox_override("panel", new_style_box)

func format_name(first_name, last_name):
	return first_name + " " + last_name

func get_color(gender, alignment):
	if alignment == "Face":
		if gender == "Female":
			return Color.PALE_VIOLET_RED
		return Color.SEA_GREEN
	elif alignment == "Heel":
		if gender == "Female":
			return Color.FIREBRICK
		return Color.REBECCA_PURPLE
	elif alignment == "Referree":
		return Color.DIM_GRAY
	elif alignment == "Booker":
		return Color.BLACK

func _on_delete_button_button_up():
	if character_id:
		CharacterDataManager.delete(character_id)
	queue_free()
