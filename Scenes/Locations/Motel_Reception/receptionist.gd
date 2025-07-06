extends StaticBody3D

func _on_interactable_object_signal_item_activated() -> void:
	Dialogic.start("Reception")
	
	
func _process(delta: float) -> void:
	if Dialogic.VAR.qestions_passed <= 4:
		GlobalItems.Ekwipunek.assign([3,-1,-1,-1,-1,-1,-1,-1])
