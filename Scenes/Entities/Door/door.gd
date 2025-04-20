extends Node3D

@export var next_scene: String
@export var door_type: String = "room"  # "room" lub "bathroom"
@onready var mesh_instance: MeshInstance3D = $StaticBody3D/MeshInstance3D

var player_near : bool = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and player_near:
		var camera = get_viewport().get_camera_3d()
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 1000

		var space_state = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(from, to)
		query.exclude = [camera]

		var result = space_state.intersect_ray(query)

		if result and result.collider == $StaticBody3D:
			print("test")
			get_tree().change_scene_to_file(next_scene)

func _ready() -> void:
	print(player_near)
	
func _on_pick_up_range_area_entered(area: Area3D) -> void:
	if area.is_in_group("Player"):
		player_near = true
	print(player_near)
	pass

func _on_pick_up_range_area_exited(area: Area3D) -> void:
	if area.is_in_group("Player"):
		player_near = false
	print(player_near)
	pass
