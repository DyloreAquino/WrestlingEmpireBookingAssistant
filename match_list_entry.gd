extends HBoxContainer
class_name MatchListEntry

func _ready():
	pass

func populate_labels(participants, stipulations, championships, show_id):
	$VBoxContainer/ScrollContainer/Participants.text = format_participants(participants)
	$VBoxContainer/HBoxContainer/VBoxContainer/Stipulation.text = format_stipulations(stipulations)
	$VBoxContainer/HBoxContainer/VBoxContainer/Championship.text = format_championships(championships)
	$VBoxContainer/HBoxContainer/Schedule.text = format_schedule(show_id)

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

func format_schedule(show_id = null):
	var show = ShowDataManager.get_show(show_id)
	var schedule = show["schedule"]
	return "Week " + str(int(schedule["week"])) + "\n" + "of " + schedule["month"]
