extends Button
@onready var zagadka_z_lodówką: Control = $".."
@onready var transition_screen: AnimationPlayer = $"../../Transition_screen/AnimationPlayer"
var clicked :bool= false


func _on_pressed() -> void:
	if !clicked:
		transition_screen.play("fade_to_black")
		clicked = true
		transition_screen.animation_set_next("fade_to_black","fade_out_of_black")
		await transition_screen.animation_changed
		zagadka_z_lodówką.visible = false
		zagadka_z_lodówką.position = Vector2(5000,5000)
		clicked = false
	pass # Replace with function body.
