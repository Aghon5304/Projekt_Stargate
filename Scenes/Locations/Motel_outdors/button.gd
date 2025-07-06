extends TextureButton
var ItemId = GlobalItems.ItemTypes.NOTATNIK
@onready var transition_screen: AnimationPlayer = $"../../Transition_screen/AnimationPlayer"
@onready var notebook: Control = $"../Notebook"

var kliknięto := false

func _on_pressed() -> void:
	if self.visible == true and !kliknięto:
		#jeżeli pole jest puste (-1) to zamienia je na ItemId (enum przedmiotu)
		kliknięto = true
		transition_screen.play("fade_to_black")
		await transition_screen.animation_changed
		notebook.position.x = 0
		notebook.visible = true	
		GlobalGameProgress.Progress["Motel_Notebook_pickup"] = true
		GlobalSignals.Item_used.emit()
		return
	pass # Replace with function body.
