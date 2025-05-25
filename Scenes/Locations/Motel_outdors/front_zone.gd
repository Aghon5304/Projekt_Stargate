extends Area3D
@onready var main_camera: Camera3D = $"../../../Main_camera"
@onready var fornt_zone: Camera3D = $"../../../fornt_zone"


func _on_area_entered(area: Area3D) -> void:
	fornt_zone.current = true
	main_camera.current=false
	main_camera.remove_from_group("Cameras")
	fornt_zone.add_to_group("Cameras")
	pass # Replace with function body.



func _on_area_exited(area: Area3D) -> void:
	fornt_zone.remove_from_group("Cameras")
	fornt_zone.current = false
	pass # Replace with function body.
