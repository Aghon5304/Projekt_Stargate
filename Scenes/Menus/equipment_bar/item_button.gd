extends Button
@export var button_number : int
#sygnał ogłaszający że nowy item został wybrany
signal wybrano_item(position)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#po kliknięciu na item emituje sygnał Item_used
func _on_pressed() -> void:
	#jeżeli item pusty to zamienia aktywny item na pusty oraz emituje sygnał wybrano item
	if(GlobalInput.Active_Item == -1):
		GlobalInput.Active_Item = GlobalItems.Ekwipunek[button_number]
		wybrano_item.emit(button_number)
	else:
		# jeżeli item nie jest pusty to sprawdzamy jaki item jest w polu wcześniej aktywowanym który klikneliśmy
		var globalinput_position = GlobalItems.Ekwipunek.find(GlobalInput.Active_Item)
		# Jeżeli istnieje crafting reciepie z wybranego i obecnego itemu to go tworzy i umieszcza w polu wcześniejszym a pole późniejsze staje się puste
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
			GlobalSignals.Item_used.emit()
		else:
			wybrano_item.emit(button_number)
	pass # Replace with function body.
