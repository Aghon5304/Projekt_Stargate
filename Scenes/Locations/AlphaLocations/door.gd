extends StaticBody3D
var playerInRange :=false

func _on_static_body_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			if GlobalInput.Active_Item == GlobalItems.ItemTypes.KLUCZ_WYJETY_Z_LODU:
				#zapisanie wartości globalnej która mówi który item został ostatnio kliknięty
				GlobalInput.Last_clicked = self
				#oczekuje do momętu w którym gracz wejdzie w zasięg przedmiotu
				while playerInRange == false:
					#jeżeli klikniemy coś innego to wyjdzie z funkcji
					if GlobalInput.Last_clicked != self:
						return
					#czeka jedną klatkę
					await get_tree().process_frame
				if (playerInRange == true):
					GlobalSignals.Item_used.emit()
					var new_scene = load("res://Scenes/Locations/end_location/end_credits.tscn")
					get_tree().change_scene_to_packed(new_scene)
		pass # Replace with function body.

func _on_pick_up_range_area_entered(area: Area3D) -> void:
	playerInRange = true
	pass # Replace with function body.


func _on_pick_up_range_area_exited(area: Area3D) -> void:
	playerInRange = false
	pass # Replace with function body.
