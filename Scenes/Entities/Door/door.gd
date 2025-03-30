extends Area3D

@export var next_scene: String

var player_near = false

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_near = true


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_near = false


func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event.is_action_pressed("LeftMouse") and player_near:
		get_tree().change_scene_to_file(next_scene)
