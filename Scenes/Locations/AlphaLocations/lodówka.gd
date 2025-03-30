extends Node3D
@export var playerInRange: bool = false 
@onready var zagadka_z_lodówką: Control = $"../../../gui/zagadka z lodówką"
func _on_pick_up_range_area_entered(area: Area3D) -> void:
	playerInRange = true
	pass # Replace with function body.


func _on_pick_up_range_area_exited(area: Area3D) -> void:
	playerInRange = false
	pass # Replace with function body.


func _on_teren_do_klikniecia_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			zagadka_z_lodówką.visible = true
			zagadka_z_lodówką.position = Vector2(0,0)
	pass # Replace with function body.
