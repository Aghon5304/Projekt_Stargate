extends Node3D
@export var ItemId := GlobalItems.ItemTypes.LATARKA
@onready var gracz: CharacterBody3D = $"../../../Gracz"
@onready var navigation_obstacle_3d: NavigationObstacle3D = $StaticBody3D/NavigationObstacle3D


func _on_static_body_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			for item in GlobalItems.Ekwipunek.size():
				if GlobalItems.Ekwipunek[item] == null:
					GlobalItems.Ekwipunek[item] = ItemId
					self.visible = false	
					navigation_obstacle_3d.avoidance_layers = 2
					var collision_shape_3d: CollisionShape3D = $StaticBody3D/CollisionShape3D
					collision_shape_3d.disabled
					var navigation_region_3d: NavigationRegion3D = $"../.."
					navigation_region_3d.bake_navigation_mesh()
					return
			print("masz za duzo itemów w eq")
	pass # Replace with function body.
