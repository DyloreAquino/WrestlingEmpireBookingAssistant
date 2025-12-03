extends Node
const PATH = "res://data/characters.json"

var characters := {}

const GENDER = ["Male", "Female", "NA"]
const ALIGNMENTS = ["Face", "Heel", "Referree", "Booker"]

func _ready():
	load_json()

func load_json():
	var data = DataManager.load_json(PATH)
	characters = data if data else {}

func save_json():
	DataManager.save_json(PATH, characters)

func get_character(id):
	if characters.has(str(int(id))):
		return characters[str(int(id))]
	return null

func add(character_data):
	var id = DataManager.generate_new_id(characters)
	characters[str(int(id))] = character_data
	save_json()

func update(id, character_data):
	characters[str(int(id))] = character_data
	save_json()

func edit(id, index, data):
	characters[str(int(id))][index] = data
	save_json()
	
func delete(id):
	characters.erase(str(int(id)))
	save_json()

func new_character_template() -> Dictionary:
	return {
		"first_name" : "",
		"last_name" : "",
		"gender" : "NA",
		"alignment" : "Face",
		"injured" : false,
		"friends" : [],
		"rivals" : [],
		"teammates" : []
	}
