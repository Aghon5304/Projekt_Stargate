extends Button
@onready var zagadka_z_lodówką: Control = $".."


func _on_pressed() -> void:
	zagadka_z_lodówką.visible = false
	pass # Replace with function body.
