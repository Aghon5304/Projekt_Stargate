extends Node3D


func _on_interactable_object_signal_item_activated() -> void:
	for x in GlobalItems.Ekwipunek.size():
		if GlobalItems.Ekwipunek[x] == GlobalItems.ItemTypes.KLUCZ_W_LODZIE:
			GlobalItems.Ekwipunek[x] = GlobalItems.ItemTypes.KLUCZ_WYJETY_Z_LODU
			GlobalSignals.Item_used.emit()
	pass # Replace with function body.
