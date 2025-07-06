extends Button

@onready var new_game = "res://Scenes/Locations/Forest/forest_location.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var Forest: PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Location.Forest)
	get_tree().change_scene_to_packed(Forest)
