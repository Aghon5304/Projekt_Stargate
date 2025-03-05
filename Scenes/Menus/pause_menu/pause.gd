extends Control

@onready var pause_menu = $MarginContainer/PauseMenu
@export var option_menu: PackedScene = preload("res://Scenes/Menus/options_menu/options_menu.tscn")
var id_not_paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainMenu.is_main_menu = false
	pause_menu.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if id_not_paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	id_not_paused = !id_not_paused


func _on_resume_button_pressed() -> void:
	pauseMenu()
	pause_menu.hide()

func _on_options_button_pressed() -> void:
	var new_scene = option_menu.instantiate()
	add_child(new_scene)
