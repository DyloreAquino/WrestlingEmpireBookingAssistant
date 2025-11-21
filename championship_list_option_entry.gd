extends ListOptionEntry
class_name ChampionshipListOptionEntry

func _ready():
	options = MatchDataManager.CHAMPIONSHIPS
	super._ready()
