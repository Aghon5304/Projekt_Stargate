extends Node3D
@onready var navigation_obstacle_3d: NavigationObstacle3D = $StaticBody3D/NavigationObstacle3D

@export var ItemId := GlobalItems.ItemTypes.LATARKA
@export var playerInRange: bool = false 

func _on_static_body_3d_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			GlobalInput.Last_clicked = self
			while playerInRange == false:
				if GlobalInput.Last_clicked != self:
					return
				await get_tree().process_frame
			if (playerInRange == true):
				for item in GlobalItems.Ekwipunek.size():
					if GlobalItems.Ekwipunek[item] == null:
						GlobalItems.Ekwipunek[item] = ItemId
						self.visible = false	
						var collision_shape_3d: CollisionShape3D = $StaticBody3D/CollisionShape3D
						collision_shape_3d.disabled = true
						var navigation_region_3d: NavigationRegion3D = $"../.."
						return
				print("masz za duzo itemów w eq")
	pass # Replace with function body.



func _on_pick_up_range_area_entered(_area: Area3D) -> void:
	playerInRange = true
	pass # Replace with function body.


func _on_pick_up_range_area_exited(_area: Area3D) -> void:
	playerInRange = false
	pass # Replace with function body.
