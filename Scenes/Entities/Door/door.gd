extends Area3D

@export var next_scene: String
@export var door_type: String = "room"  # "room" lub "bathroom"
@onready var mesh_instance: MeshInstance3D = $meshInstance3D

var player_near = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action") and player_near:
		get_tree().change_scene_to_file(next_scene)

func _ready():
	if door_type == "room":
		mesh_instance.mesh = preload("res://Assets/mesh/doors/MainDoorMesh.tres")
	elif door_type == "bathroom":
		mesh_instance.mesh = preload("res://Assets/mesh/doors/bathroomDoorMesh.tres")
	pass

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_near = true
	
func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_near = false
