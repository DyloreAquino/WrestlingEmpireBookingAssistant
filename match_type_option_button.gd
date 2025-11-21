extends OptionButton

func _ready():
	for match_type in MatchDataManager.MATCH_TYPES:
		add_item(match_type)
