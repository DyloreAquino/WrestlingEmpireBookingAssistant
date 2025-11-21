extends Node
const PATH = "res://data/matches.json"

var matches := {}

const MATCH_TYPES = ["Singles", "Tag Team", "Team", "Triple Threat", 
					"Fatal Four-Way", "Handicap", "Gauntlet", "Battle Royale", 
					"Royal Rumble"]
const STIPULATIONS = ["Hardcore", "Open Challenge", "Confrontation", 
					"Best of Three", "Ironman", "Last Laugh", "Submission", 
					"Last Man Standing", "Street Fight", "First Blood", 
					"Sumo Contest", "Shoot Fight", "Tag Elimination", "War", 
					"Elimination", "Escape to Victory", "Furniture Smash", 
					"Ladder", "Hell in a Cell", "Training"]
const CHAMPIONSHIPS = ["World Championship", "Intercontinental Championship", 
					"Tag Team Championship", "Women's Championship"]

func _ready():
	load_json()

func load_json():
	var data = DataManager.load_json(PATH)
	matches = data if data else {}

func save_json():
	DataManager.save_json(PATH, matches)

func get_match(id):
	if matches.has(str(int(id))):
		return matches[str(int(id))]
	return null

func add(match_data):
	var id = DataManager.generate_new_id(matches)
	matches[str(int(id))] = match_data
	save_json()

func update(id, match_data):
	matches[str(int(id))] = match_data
	save_json()

func edit(id, index, data):
	matches[str(int(id))][index] = data
	save_json()

func delete(id):
	matches.erase(str(int(id)))
	save_json()

func new_match_template() -> Dictionary:
	return {
		"participants": [],
		"show_id" : 1,
		"match_type" : "Singles",
		"stipulations" : [],
		"championships" : [],
		"outcome": {
			"stars": null,
			"winner": [],
			"injury": [],
			"interruptions": [],
			"heel_turn": [],
			"face_turn": [],
			"team_formation": [],
			"rivalry_formation": [],
			"friend_formation": []
		}
	}
