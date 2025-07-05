extends Area3D
@export var current_camera: Camera3D 
@onready var cameras_location: Node3D = $"../../Camera"

func _on_area_entered(area: Area3D) -> void:
	if(area.is_in_group("Player")):
		if(!current_camera.is_in_group("Cameras")):
			var all_cameras = cameras_location.get_children()
			for x in all_cameras:
				x.current = false
				x.remove_from_group("Cameras")
			current_camera.current = true
			current_camera.add_to_group("Cameras")
	pass # Replace with function body.
