extends Node3D

@export var next_scene: String
@export var door_type: String = "room"  # "room" lub "bathroom"
@onready var mesh_instance: MeshInstance3D = $StaticBody3D/meshInstance3D

var player_near = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action") and player_near:
		get_tree().change_scene_to_file(next_scene)

	
func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Player"):
		player_near = true
	print(player_near)

func _on_area_exited(area: Area3D) -> void:
	if area.is_in_group("Player"):
		player_near = false
	print(player_near)
