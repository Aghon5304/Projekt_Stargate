extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var end: PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Location.napisy2)
	get_tree().change_scene_to_packed(end)
