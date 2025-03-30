extends Button
@onready var zagadka_z_lodówką: Control = $".."


func _on_pressed() -> void:
	zagadka_z_lodówką.visible = false
	zagadka_z_lodówką.position = Vector2(5000,5000)
	pass # Replace with function body.
