extends Node3D
@export var playerInRange: bool = false
@export var requiredItem : GlobalItems.ItemTypes = GlobalItems.ItemTypes.BRAK_ITEMU
@export var monolog : String
var isMouseOnBlock := false
signal bohaterMonolog(dialog: String)

func _on_pick_up_range_area_entered(area: Area3D) -> void:
	playerInRange = true
	pass # Replace with function body.


func _on_pick_up_range_area_exited(area: Area3D) -> void:
	playerInRange = false
	pass # Replace with function body.

func _on_teren_do_klikniecia_mouse_entered() -> void:
	isMouseOnBlock = true
	pass # Replace with function body.


func _on_teren_do_klikniecia_mouse_exited() -> void:
	isMouseOnBlock = false
	if(GlobalInput.Active_Item==-1):
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	pass # Replace with function body.

func _process(delta: float) -> void:
	if(GlobalInput.Active_Item==-1 and isMouseOnBlock):
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

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
			if GlobalInput.Active_Item == requiredItem:
				for x in GlobalItems.Ekwipunek.size():
					if GlobalItems.Ekwipunek[x] == requiredItem:
						GlobalSignals.emit_signal("Bohater_monolog",monolog)
			elif requiredItem == GlobalItems.ItemTypes.BRAK_ITEMU:
				GlobalSignals.emit_signal("Bohater_monolog",monolog)
	pass # Replace with function body.
