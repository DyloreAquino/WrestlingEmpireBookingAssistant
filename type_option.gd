extends OptionButton

func _ready():
	for type in ShowDataManager.TYPES:
		add_item(type)
	get_popup().add_theme_font_size_override("font_size", 50)
