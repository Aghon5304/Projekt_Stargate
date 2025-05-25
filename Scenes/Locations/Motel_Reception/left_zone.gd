extends Area3D


func _on_area_entered(area: Area3D) -> void:
	GlobalGameProgress.Current_Location = GlobalGameProgress.Location.Motel_outdoors
	var exit :PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Location.Motel_outdoors)
	get_tree().change_scene_to_packed(exit)
	pass # Replace with function body.
