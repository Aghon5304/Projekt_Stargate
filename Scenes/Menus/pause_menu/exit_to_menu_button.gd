extends Button

@export var main_menu:PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_to_menu_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)
	MainMenu.is_main_menu = true
