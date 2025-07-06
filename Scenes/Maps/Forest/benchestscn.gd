extends Node3D

var count = 0

func _on_interactable_object_signal_item_activated() -> void:
	if count == 0:
		if 10 not in GlobalItems.Ekwipunek or 11 not in GlobalItems.Ekwipunek:
			GlobalItems.Ekwipunek.insert(0,10)
			Dialogic.start("walkie-talkie_interaction")
			count += 1
