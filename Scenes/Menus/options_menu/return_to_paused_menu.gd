extends Button

@onready var return_to_paused_menu = "res://Scenes/Menus/pause_menu/pause_menu.tscn" 
@onready var return_to_main_menu = "res://Scenes/Menus/main_menu/main_menu.tscn"
@onready var opitions_menu = $".."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if MainMenu.is_main_menu:
		get_tree().change_scene_to_file(return_to_main_menu)
	else:
		opitions_menu.hide()

	
