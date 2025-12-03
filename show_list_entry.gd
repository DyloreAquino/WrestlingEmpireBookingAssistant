extends Control
class_name ShowListEntry

@export var title_label : Label
@export var week_label : Label
@export var month_label : Label
@export var type_label : Label

var show_id = null

func _ready():
	pass

func populate_labels(title, schedule, type):
	title_label.text = title
	week_label.text = str(int(schedule["week"])) + "th"
	month_label.text = schedule["month"]
	type_label.text = type

func _on_delete_button_button_up():
	if show_id:
		ShowDataManager.delete(show_id)
	queue_free()
