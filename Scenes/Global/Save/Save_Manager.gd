extends Node
var save_path := "user://Save_file.ini"
func Save_game_state():
	var config_file := ConfigFile.new()
	
	config_file.set_value("World","Location",GlobalGameProgress.Current_Location)
	config_file.set_value("Player","Items",GlobalItems.Ekwipunek)
	config_file.set_value("GameState","Progress",GlobalGameProgress.Progress)
	
	var error := config_file.save(save_path)
	if error:
		print("An error happened while saving data: ", error)

func Load_game_state():
	var config_file := ConfigFile.new()
	var error := config_file.load(save_path)
	
	if error:
		print("An error happened while loading data: ", error)
		return
	
	# wczytuje dane z saveu oraz ustawia deafult value
	GlobalGameProgress.Current_Location = config_file.get_value("World","Location", GlobalGameProgress.Location.Lokacja_testowa)
	GlobalItems.Ekwipunek = config_file.get_value("Player","Items",[-1,-1,-1,-1,-1,-1,-1,-1])
	GlobalGameProgress.Progress = config_file.get_value("GameState","Progress",null)
	
