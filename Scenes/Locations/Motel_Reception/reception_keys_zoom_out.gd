extends Button

@onready var camera_3d: Camera3D = $"../../../Camera3D"
@onready var reception_key_camera: Camera3D = $"../../../ReceptionKeyCamera"
@onready var reception_keys_zoom_out: Button = $"."

func _on_reception_keys_zoom_out_pressed() -> void:
	reception_keys_zoom_out.visible = false
	reception_keys_zoom_out.position.x = 9000
	camera_3d.current = true
	reception_key_camera.current = false
	camera_3d.rotate_y(-180)
	pass # Replace with function body.
