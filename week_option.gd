extends OptionButton

func _ready():
	for week in ShowDataManager.WEEKS:
		add_item(week)
	get_popup().add_theme_font_size_override("font_size", 50)
