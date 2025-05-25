extends Node3D


func _on_reception_door_item_activated() -> void:
	GlobalGameProgress.Current_Location = GlobalGameProgress.Location.Motel_reception
	var scene :PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Location.Motel_reception)
	get_tree().change_scene_to_packed(scene)
	pass # Replace with function body.
