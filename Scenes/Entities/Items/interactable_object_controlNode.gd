extends Node3D
@export var playerInRange: bool = false 
@export var zagadkaControlNode: Control 
@export var transitionScreen: Control
@export var requiredItem : GlobalItems.ItemTypes
var animationPlayer : AnimationPlayer
var isMouseOnBlock := false

func _ready() -> void:
	animationPlayer = transitionScreen.get_node_or_null("AnimationPlayer")

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
			if GlobalInput.Active_Item == requiredItem or requiredItem == GlobalItems.ItemTypes.BRAK_ITEMU:
				animationPlayer.animation_set_next("fade_to_black","fade_out_of_black")
				animationPlayer.play("fade_to_black")
				GlobalSignals.Item_used.emit()
				await  animationPlayer.animation_changed
				zagadkaControlNode.visible = true
				zagadkaControlNode.position = Vector2(0,0)
	pass # Replace with function body.
