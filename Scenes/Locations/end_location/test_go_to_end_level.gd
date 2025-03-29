extends StaticBody3D


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		print("Witam")
		var new_scene = load("res://Scenes/Locations/end_location/end_credits.tscn")
		get_tree().change_scene_to_packed(new_scene)
