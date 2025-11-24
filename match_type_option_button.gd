extends OptionButton

func _ready():
	for match_type in MatchDataManager.MATCH_TYPES:
		add_item(match_type)
	get_popup().add_theme_font_size_override("font_size", 50)
