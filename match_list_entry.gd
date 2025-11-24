extends Control
class_name MatchListEntry

@export var participants_label : Label
@export var stipulations_label : Label
@export var championships_label : Label

var match_id = null

func _ready():
	pass

func populate_labels(participants, stipulations, championships):
	participants_label.text = format_participants(participants)
	stipulations_label.text = format_stipulations(stipulations)
	championships_label.text = format_championships(championships)

func format_participants(participants : Array):
	var names = []
	for team in participants:
		var team_names = []
		for character_id in team:
			var character_name = CharacterDataManager.get_character(character_id)["last_name"]
			team_names.append(character_name)
		names.append(team_names)
	var result = []
	for team in names:
		result.append(", ".join(team))
	return " VS. ".join(result)

func format_stipulations(stipulations : Array):
	return ", ".join(stipulations)

func format_championships(championships : Array):
	return ", ".join(championships)

func _on_delete_button_button_up():
	if match_id:
		MatchDataManager.delete(match_id)
	queue_free()
