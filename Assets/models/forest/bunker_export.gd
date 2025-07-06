extends Node3D
var count = 0
@export var transitionScreen: Control
var animationPlayer : AnimationPlayer

func _ready() -> void:
	animationPlayer = transitionScreen.get_node_or_null("AnimationPlayer")
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	animationPlayer.play("fade_to_black")
	var Motel_transition: PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Location.transition_to_motel)
	get_tree().change_scene_to_packed(Motel_transition)
	
func _on_interactable_object_signal_item_activated() -> void:
	Dialogic.timeline_ended.connect(ended)
	if count == 0:
		if 8 in GlobalItems.Ekwipunek:
			Dialogic.start("Doors_open")
			Dialogic.start("end")
			GlobalItems.Ekwipunek.assign([-1,-1,-1,-1,-1,-1,-1,-1])
			count += 1
		else:
			Dialogic.start("Doors_hint")
