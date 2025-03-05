extends Control

@onready var return_to_paused_menu ="res://Scenes/Menus/pause_menu/pause_menu.tscn"
@onready var return_to_main_menu = "res://Scenes/Menus/main_menu/main_menu.tscn"
@onready var options_menu = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if MainMenu.is_main_menu:
		if Input.is_action_just_pressed("return_back"):
			get_tree().change_scene_to_file(return_to_main_menu)
	else:
		if Input.is_action_just_pressed("close_option_menu"):
			options_menu.hide()
