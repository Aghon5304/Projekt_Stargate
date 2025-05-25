extends Control

@onready var guest_book: Control = $"."
@export var transition_screen: ColorRect
var clicked :bool= false
var animationPlayer : AnimationPlayer

func _ready() -> void:
	animationPlayer = transition_screen.get_child(0)
func _on_button_pressed() -> void:
	
	if !clicked:
		animationPlayer.play("fade_to_black")
		clicked = true
		animationPlayer.animation_set_next("fade_to_black","fade_out_of_black")
		await animationPlayer.animation_changed
		guest_book.visible = false
		guest_book.position = Vector2(5000,5000)
		clicked = false
	pass # Replace with function body.
