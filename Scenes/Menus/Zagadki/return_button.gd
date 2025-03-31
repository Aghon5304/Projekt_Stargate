extends Button
@onready var zagadka_z_lodówką: Control = $".."
@onready var fadeout: AnimationPlayer = $"../Fadeout"


func _on_pressed() -> void:
	fadeout.play("Fadeout")
	await get_tree().create_timer(2).timeout
	zagadka_z_lodówką.visible = false
	zagadka_z_lodówką.position = Vector2(5000,5000)
	pass # Replace with function body.
