extends Node3D
@export var fishcola : Node3D
@export var Transition_screen : Control
var animationPlayer : AnimationPlayer 

func _ready():
	animationPlayer = Transition_screen.get_node_or_null("AnimationPlayer")
	if GlobalGameProgress.Progress.get("Motel_Fishcola_pickup"):
		fishcola.visible = false


func _on_interactable_object_signal_item_activated() -> void:
	if GlobalGameProgress.Progress.get("Motel_Fishcola_pickup") != true:
		for x in GlobalItems.Ekwipunek.size():
			if GlobalItems.Ekwipunek[x] == -1:
				animationPlayer.play("fade_to_black")
				animationPlayer.queue("fade_out_of_black")
				await animationPlayer.animation_changed
				GlobalItems.Ekwipunek[x] = GlobalItems.ItemTypes.FISHCOLA
				GlobalSignals.Item_used.emit()
				fishcola.visible = false
				GlobalGameProgress.Progress.set("Motel_Fishcola_pickup",true)
				return
		
	pass # Replace with function body.
