extends Node3D

func _on_reception_door_item_activated() -> void:
	GlobalGameProgress.Current_Location=GlobalGameProgress.Location.Lokacja_testowa
	var s :PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Location.napisy)
	get_tree().change_scene_to_packed(s)
	pass # Replace with function body.
