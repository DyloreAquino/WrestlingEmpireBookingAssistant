extends OptionButton

func _ready():
	for month in ShowDataManager.MONTHS:
		add_item(month)
	get_popup().add_theme_font_size_override("font_size", 50)
