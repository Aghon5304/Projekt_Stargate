extends Node3D

@onready var fence  = $"../Fence Export"
var count = 0

func _on_interactable_object_signal_item_activated() -> void:
	Dialogic.VAR.have_pass = 1
	GlobalItems.Ekwipunek.assign([-1,-1,-1,-1,-1,-1,-1,-1])
	Dialogic.start("guard_timeline")
	if fence != null:
		fence.queue_free()

func _ready() -> void:
	GlobalItems.Ekwipunek.insert(0,7)
	
func _process(delta: float) -> void:
	if count == 0:
		if 11 in GlobalItems.Ekwipunek:
			Dialogic.start("after_walkie-talkie_puzzle")
			count += 1
			$".".hide()
