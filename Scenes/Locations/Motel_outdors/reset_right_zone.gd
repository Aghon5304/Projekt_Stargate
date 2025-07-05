extends Area3D
@onready var main_camera: Camera3D = $"../../../Main_camera"


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Player"):
		main_camera.current=true
		main_camera.add_to_group("Cameras")
	pass # Replace with function body.
