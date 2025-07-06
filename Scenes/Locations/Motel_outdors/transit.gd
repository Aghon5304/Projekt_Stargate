extends Button

@onready var new_game = "res://Scenes/Locations/Forest/forest_location.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var Motel_transition: PackedScene= GlobalGameProgress.Locations_dict.get(GlobalGameProgress.Location.Motel_outdoors)
	get_tree().change_scene_to_packed(Motel_transition)
