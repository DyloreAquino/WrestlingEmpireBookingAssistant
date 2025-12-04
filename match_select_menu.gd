extends SelectMenu

func _ready():
	super._ready()
	populate_buttons()

func populate_buttons():
	MatchDataManager.load_json()
	var matches = MatchDataManager.matches
	
	for division in flow_containers.keys():
		for c in flow_containers[division].get_children():
			c.queue_free()
		for id in matches.keys():
			if matches[id]["winner"].size() == 0:
				var label = ""
				if matches[id]["title"] == "":
					label = format_participants(matches[id]["participants"])
				else:
					label = matches[id]["title"]
				var color = Color.DIM_GRAY
				add_select_button(id, division, label, color)

func format_participants(participants : Array):
	var names = []
	for team in participants:
		var team_names = []
		for character_id in team:
			var character_name = CharacterDataManager.get_character(character_id)["last_name"]
			if character_name != "":
				team_names.append(character_name)
			else:
				character_name = CharacterDataManager.get_character(character_id)["first_name"]
				team_names.append(character_name)
		names.append(team_names)
	var result = []
	for team in names:
		result.append(", ".join(team))
	return " VS. ".join(result)
