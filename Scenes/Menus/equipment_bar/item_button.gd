extends Button
@export var button_number : int
signal wybrano_item
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	
	GlobalSignals.Item_used.emit()
	if(GlobalInput.Active_Item== -1):
		GlobalInput.Active_Item = GlobalItems.Ekwipunek[button_number]
		wybrano_item.emit()
	else:
		var globalinput_position = GlobalItems.Ekwipunek.find(GlobalInput.Active_Item)
		if GlobalItems.Crafting.has(Vector2(GlobalItems.Ekwipunek[button_number],GlobalInput.Active_Item)):
			var crafted = GlobalItems.Crafting[Vector2(GlobalItems.Ekwipunek[button_number],GlobalInput.Active_Item)]
			GlobalItems.Ekwipunek[button_number] = -1
			GlobalItems.Ekwipunek[globalinput_position] = -1
			if(globalinput_position<button_number):
				GlobalItems.Ekwipunek[globalinput_position] = crafted
			elif (globalinput_position!=button_number):
				GlobalItems.Ekwipunek[button_number] = crafted
			else:
				GlobalItems.Ekwipunek[button_number] = crafted
	pass # Replace with function body.
