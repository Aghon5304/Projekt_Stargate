extends Button


func _on_pressed() -> void:
	GlobalSaveManager.Save_game_state()
	text = "Game saved !"
	await get_tree().create_timer(2.0).timeout
	text = "Save Game"
	pass # Replace with function body.
