extends Button

@onready var to_prologue = "res://Scenes/Menus/prologue/prologue.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed_new_game_button() -> void:
	var Forest :PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Location.Forest)
	get_tree().change_scene_to_packed(Forest)# Replace with function body.
