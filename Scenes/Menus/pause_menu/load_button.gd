extends Button


func _on_pressed() -> void:
	GlobalSaveManager.Load_game_state()
	var new_scene :PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Current_Location)
	get_tree().change_scene_to_packed(new_scene)
	pass 
