extends Node3D
@export var playerInRange: bool = false 
@onready var transition_screen: AnimationPlayer = $"../../../gui/Transition_screen/AnimationPlayer"

func _on_pick_up_range_area_entered(area: Area3D) -> void:
	playerInRange = true
	pass # Replace with function body.


func _on_pick_up_range_area_exited(area: Area3D) -> void:
	playerInRange = false
	pass # Replace with function body.


func _on_teren_do_klikniecia_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			GlobalInput.Last_clicked = self
			while playerInRange == false:
				#jeżeli klikniemy coś innego to wyjdzie z funkcji
				if GlobalInput.Last_clicked != self:
					return
				#czeka jedną klatkę
				await get_tree().process_frame
			if GlobalInput.Active_Item == GlobalItems.ItemTypes.KLUCZ_W_LODZIE:
				for x in GlobalItems.Ekwipunek.size():
					if GlobalItems.Ekwipunek[x] == GlobalItems.ItemTypes.KLUCZ_W_LODZIE:
						transition_screen.play("fade_to_black")
						await transition_screen.animation_changed
						GlobalItems.Ekwipunek[x] = GlobalItems.ItemTypes.KLUCZ_WYJETY_Z_LODU
						GlobalSignals.Item_used.emit()
	pass # Replace with function body.
