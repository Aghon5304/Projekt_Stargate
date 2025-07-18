extends Area3D
@onready var following_camera: Camera3D = $"../../../Gracz/camera_controller/Camera_target/following camera"
@onready var main_camera: Camera3D = $"../../../Main_camera"
@onready var camera_controller: Node3D = $"../../../Gracz/camera_controller"


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Player"):
		camera_controller.rotation_degrees.y =-90
		following_camera.current = true
		main_camera.current=false
		main_camera.remove_from_group("Cameras")
		following_camera.add_to_group("Cameras")
		pass # Replace with function body.



func _on_area_exited(area: Area3D) -> void:
	if area.is_in_group("Player"):
		following_camera.remove_from_group("Cameras")
		following_camera.current = false
	pass # Replace with function body.
