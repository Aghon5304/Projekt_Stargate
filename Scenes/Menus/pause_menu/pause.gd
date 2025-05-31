extends Control
@onready var pause_menu: Control = $"."
@export var option_menu: PackedScene = preload("res://Scenes/Menus/options_menu/options_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainMenu.is_main_menu = false
	GlobalSignals.is_not_paused = true
	pauseMenu()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if GlobalSignals.is_not_paused:
		pause_menu.show()
		pause_menu.position = Vector2(5000,5000)
		Engine.time_scale = 1
	else:
		pause_menu.position = Vector2(0,0)
		Engine.time_scale = 0
	GlobalSignals.is_not_paused = !GlobalSignals.is_not_paused


func _on_resume_button_pressed() -> void:
	pauseMenu()
	pause_menu.position = Vector2(5000,5000)

func _on_options_button_pressed() -> void:
	var new_scene = option_menu.instantiate()
	add_child(new_scene)
