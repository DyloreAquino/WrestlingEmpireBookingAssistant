extends SelectMenu

func _ready():
	super._ready()
	populate_buttons()

func populate_buttons():
	CharacterDataManager.load_json()
	var characters = CharacterDataManager.characters
	
	for division in flow_containers.keys():
		for c in flow_containers[division].get_children():
			c.queue_free()
		for id in characters.keys():
			if characters[id]["alignment"] == str(division):
				var label = str(characters[id]["first_name"] + " " + characters[id]["last_name"])
				var color = get_color(characters[id])
				add_select_button(id, division, label, color)

func get_color(character : Dictionary):
	if character["alignment"] == "Face":
		if character["gender"] == "Female":
			return Color.PALE_VIOLET_RED
		return Color.SEA_GREEN
	elif character["alignment"] == "Heel":
		if character["gender"] == "Female":
			return Color.FIREBRICK
		return Color.REBECCA_PURPLE
	elif character["alignment"] == "Referree":
		return Color.DIM_GRAY
	elif character["alignment"] == "Booker":
		return Color.BLACK

func _on_visibility_changed():
	populate_buttons()
