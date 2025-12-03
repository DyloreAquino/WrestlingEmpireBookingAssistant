extends HBoxContainer

func _on_matches_button_up():
	$"../MatchListView".visible = true
	$"../CharacterListView".visible = false
	$"../ShowListView".visible = false

func _on_shows_button_up():
	$"../ShowListView".visible = true
	$"../MatchListView".visible = false
	$"../CharacterListView".visible = false

func _on_characters_button_up():
	$"../CharacterListView".visible = true
	$"../MatchListView".visible = false
	$"../ShowListView".visible = false
