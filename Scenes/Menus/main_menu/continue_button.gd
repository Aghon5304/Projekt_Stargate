extends Button

@onready var last_played_scene = $''
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	


func _on_continue_button_pressed() -> void:
		get_tree().change_scene_to_file(last_played_scene)
