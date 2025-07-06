extends Node3D

var count = 0

func _on_interactable_object_signal_item_activated() -> void:
	if count == 0:
		if 8 not in GlobalItems.Ekwipunek and 11 in GlobalItems.Ekwipunek:
			GlobalItems.Ekwipunek.insert(0,8)
			count += 1
		else:
			Dialogic.start("boltcutters_warning")
