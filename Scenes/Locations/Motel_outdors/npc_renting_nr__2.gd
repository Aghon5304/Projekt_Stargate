extends Node3D

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_interactable_object_signal_item_activated() -> void:
	Dialogic.start("Kobieta z Fish Colą")
	pass # Replace with function body.
	
func _on_dialogic_signal(argument: String):
	if argument == "dano_fishcole":
		GlobalGameProgress.Progress["Motel_dano_fishcole"] = true
		GlobalItems.Ekwipunek[GlobalItems.Ekwipunek.find(GlobalItems.ItemTypes.FISHCOLA)] = -1
		GlobalSignals.Item_used
	if argument == "Pierwsza_rozmowa":
		GlobalGameProgress.Progress["Motel_pierwsza_pani_od_fishcoli"] = true
