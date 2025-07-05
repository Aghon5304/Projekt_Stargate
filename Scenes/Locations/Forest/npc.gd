extends Node3D



func _on_interactable_object_signal_item_activated() -> void:
	Dialogic.start("guard_timeline")
	pass


func _on_interactable_object_signal_2_item_activated() -> void:
	Dialogic.VAR.have_pass = 1
	GlobalItems.Ekwipunek.assign([-1,-1,-1,-1,-1,-1,-1,-1])
	Dialogic.start("guard_timeline")
	


func _on_interactable_object_signal_2_visibility_changed() -> void:
	Dialogic.VAR.have_pass = 1
	GlobalItems.Ekwipunek.assign([-1,-1,-1,-1,-1,-1,-1,-1])
	Dialogic.start("guard_timeline")
