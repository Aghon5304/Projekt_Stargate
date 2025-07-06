extends Button
@onready var transition_screen: AnimationPlayer = $"../../../../Transition_screen/AnimationPlayer"
var clicked :bool= false
@onready var notebook: Control = $"../.."


func _on_pressed() -> void:
	if !clicked and self.visible == true:
		transition_screen.play("fade_to_black")
		clicked = true
		transition_screen.animation_set_next("fade_to_black","fade_out_of_black")
		await transition_screen.animation_changed
		notebook.visible = false
		notebook.position.x=3000
		clicked = false
	pass # Replace with function body.
