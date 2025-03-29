extends Node3D
#definiowanie itemu jakim jest TestBox jako enum
@export var ItemId := GlobalItems.ItemTypes.LATARKA
@export var playerInRange: bool = false 

#Sprawdzanie czy coś klikneło w static body 3d myszką
func _on_static_body_3d_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
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
				#Jeżeli w zasięgu to przechodzi przez każdy item w eq
				for item in GlobalItems.Ekwipunek.size():
					#jeżeli pole jest puste (-1) to zamienia je na ItemId (enum przedmiotu)
					if GlobalItems.Ekwipunek[item] == -1:
						GlobalItems.Ekwipunek[item] = ItemId
						#przedmiot staje się niewidzalny oraz colishion shape się wyłącza aby symulować podniesienie
						self.visible = false	
						var collision_shape_3d: CollisionShape3D = $StaticBody3D/CollisionShape3D
						collision_shape_3d.disabled = true
						return
				#jeżeli masz pełny ekwipunkek to wypisuje wiadomość
				print("masz za duzo itemów w eq")
	pass # Replace with function body.



func _on_pick_up_range_area_entered(area: Area3D) -> void:
	#oczekiwanie na sygnał określający wejście w zasięg przedmiotu który zmienia zmienną
	if area.is_in_group("Player"):
		playerInRange = true
	pass


func _on_pick_up_range_area_exited(area: Area3D) -> void:
	if area.is_in_group("Player"):
		playerInRange = false
	pass
