extends Node3D
@export var trash : Node3D
@export var Transition_screen : Control
var animationPlayer : AnimationPlayer 

func _ready():
	if GlobalGameProgress.Progress.get("Forest_Trash_pick_up"):
		trash.visible = false
	animationPlayer = Transition_screen.get_node_or_null("AnimationPlayer")


func _on_interactable_object_signal_item_activated() -> void:
	if GlobalGameProgress.Progress.get("Forest_Trash_pick_up") != true:
		for x in GlobalItems.Ekwipunek.size():
			if GlobalItems.Ekwipunek[x] == -1:
				animationPlayer.play("fade_to_black")
				animationPlayer.queue("fade_out_of_black")
				await animationPlayer.animation_changed
				GlobalItems.Ekwipunek[x] = GlobalItems.ItemTypes.KAWALEK_ZLOMU
				GlobalSignals.Item_used.emit()
				trash.visible = false
				GlobalGameProgress.Progress.set("Forest_Trash_pick_up",true)
				return
		
	pass # Replace with function body.
