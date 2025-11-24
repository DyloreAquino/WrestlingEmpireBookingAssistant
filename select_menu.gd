extends Control
class_name SelectMenu

@onready var main_container = $ScrollContainer/VBoxContainer
var select_button = preload("res://select_button.tscn")

var options = {}
var divisions = []
var flow_containers = {}

signal selected(selection)

func _ready():
	initialize_lists()

func initialize_lists():
	for child in main_container.get_children():
		divisions.append(child)
	for division in divisions:
		flow_containers[division.name] = division.get_node_or_null("FlowContainer")

func add_select_button(id, division, label, color):
	var new_select_button : SelectButton = select_button.instantiate()
	new_select_button.selection = id
	new_select_button.label = str(label)
	new_select_button.color = color
	flow_containers[str(division)].add_child(new_select_button)
	new_select_button.button_up.connect(return_selected.bind(new_select_button.selection))

func return_selected(selection : String):
	selected.emit(selection)
