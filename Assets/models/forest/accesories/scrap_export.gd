extends Node3D

var count = 0


func _on_interactable_object_signal_item_activated() -> void:
	if count == 0:
		if 9 not in GlobalItems.Ekwipunek or 11 not in GlobalItems.Ekwipunek:
			GlobalItems.Ekwipunek.insert(0,9)
			Dialogic.start("thrash_pickup")
			count += 1
