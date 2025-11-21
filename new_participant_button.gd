extends Button

var character_select_menu = preload("res://character_select_menu.tscn")

func _on_button_up():
	get_tree().change_scene_to_packed(character_select_menu)
