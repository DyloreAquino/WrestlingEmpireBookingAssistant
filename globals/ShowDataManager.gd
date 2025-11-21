extends Node
const PATH = "res://data/shows.json"

var shows := {}

const WEEKS = ["1", "2", "3", "4"]
const MONTHS = ["January","February","March","April","May","June","July","August","September","October","November","December"]
const TYPES = ["TV Broadcast", "PPV"]

func _ready():
	load_json()

func load_json():
	var data = DataManager.load_json(PATH)
	shows = data if data else {}

func save_json():
	DataManager.save_json(PATH, shows)

func get_show(id):
	if shows.has(str(int(id))):
		return shows[str(int(id))]
	return null

func add(show_data):
	var id = DataManager.generate_new_id(shows)
	shows[str(int(id))] = show_data
	save_json()

func update(id, show_data):
	shows[str(int(id))] = show_data
	save_json()

func edit(id, index, data):
	shows[str(int(id))][index] = data
	save_json()

func delete(id):
	shows.erase(str(int(id)))
	save_json()

func new_show_template() -> Dictionary:
	return {
		"title" : "TV Program",
		"schedule" : {
			"week" : 1,
			"month" : "January" 
		},
		"type" : "PPV",
		"matches" : [],
		"finished" : false
	}
