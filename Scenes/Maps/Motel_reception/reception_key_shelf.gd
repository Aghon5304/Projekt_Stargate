extends Node3D

@onready var camera_3d: Camera3D = $"../../../Camera3D"
@onready var reception_key_camera: Camera3D = $"../../../ReceptionKeyCamera"
@onready var reception_keys_zoom_out: Button = $"../../../gui/button/ReceptionKeysZoomOut"



func _on_interactable_object_signal_item_activated() -> void:
	reception_keys_zoom_out.position.x = 0
	reception_keys_zoom_out.visible = true
	camera_3d.current = false
	reception_key_camera.current = true
	camera_3d.rotate_y(180)
	pass # Replace with function body.
