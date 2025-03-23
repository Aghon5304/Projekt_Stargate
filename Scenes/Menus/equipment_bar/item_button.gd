extends Button
@export var button_number : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	print(button_number)
	print(GlobalItems.Ekwipunek[button_number])
	pass # Replace with function body.
