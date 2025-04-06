extends Button
#tymczasowa mapa alpha :) 
@onready var new_game_scene = "res://Scenes/Locations/AlphaLocations/livingRoom.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed_new_game_button() -> void:
	get_tree().change_scene_to_file(new_game_scene) # Replace with function body.
