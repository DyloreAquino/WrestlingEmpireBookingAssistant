extends OptionButton

func _ready():
	for gender in CharacterDataManager.GENDER:
		add_item(gender)
	get_popup().add_theme_font_size_override("font_size", 50)
