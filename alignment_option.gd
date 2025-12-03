extends OptionButton

func _ready():
	for alignment_ in CharacterDataManager.ALIGNMENTS:
		add_item(alignment_)
	get_popup().add_theme_font_size_override("font_size", 50)
