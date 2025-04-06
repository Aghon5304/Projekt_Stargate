extends Node2D

@onready var credits_label = $Authors

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(credits_label, "position:y", 500, 10).set_trans(Tween.TRANS_LINEAR)	
	await tween.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu/main_menu.tscn")
	#get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
