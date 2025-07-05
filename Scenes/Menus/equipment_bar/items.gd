extends GridContainer
@export var Icons : Array[Texture2D] = []
@export	 var NoIcon : Texture2D = null
@onready var buttons := get_children()

func _ready() -> void:
	GlobalSignals.Item_used.connect(_on_item_used)
	#Stworzenie tabeli Icons do której wpisuje się wszystkie ikony przedmiotów
	Icons.resize(GlobalItems.ItemTypes.size())
	Icons[GlobalItems.ItemTypes.LATARKA] = preload("res://Assets/Images/icon.svg")
	Icons[GlobalItems.ItemTypes.PISTOLET] = preload("res://Assets/Images/Bez tytułu.png")
	Icons[GlobalItems.ItemTypes.NOTATNIK] = preload("res://Assets/Images/icon.svg")
	Icons[GlobalItems.ItemTypes.KLUCZ_W_LODZIE] = preload("res://Assets/Images/Key_in_Ice_cursor.png")
	Icons[GlobalItems.ItemTypes.KLUCZ_WYJETY_Z_LODU] = preload("res://Assets/Images/Key_v1_cursor.png")
	Icons[GlobalItems.ItemTypes.KAWALEK_ZLOMU] = preload("res://Assets/Images/Zom.png")
	Icons[GlobalItems.ItemTypes.FISHCOLA] = preload("res://Assets/Images/Fishcola-image.png")
	Icons[GlobalItems.ItemTypes.NOTATNIK] = preload("res://Assets/Images/Motel/Notebook_icon.png")
	Icons[GlobalItems.ItemTypes.PRZEPUSTKA] = preload("res://Assets/Images/Access_Pass_cursor.png")
	#przy starcie sceny wypełnia gui ekwipunkek porpawnymi ikonami
		
	for x in buttons.size():
		buttons[x].button_number = x
		if GlobalItems.Ekwipunek[x]!= -1:
			buttons[x].get_node("TextureRect").texture = Icons[GlobalItems.Ekwipunek[x]]
		else:
			buttons[x].get_node("TextureRect").texture = NoIcon
			
func _process(delta: float) -> void:
	
	pass

#jeżeli nastąpi zmiana ekwipunku aktualizuje ikony
func _on_item_used():
	Input.set_custom_mouse_cursor(null)
	GlobalInput.Active_Item = -1
	for x in buttons.size():
		if GlobalItems.Ekwipunek[x]!= -1:
			buttons[x].get_node("TextureRect").texture = Icons[GlobalItems.Ekwipunek[x]]
		else:
			buttons[x].get_node("TextureRect").texture = NoIcon
	pass

#jeżeli zostanie wybrany item z ekwipunku to zmienia ikone kursora
func _on_item_button_wybrano_item(Position) -> void:
	if GlobalItems.Ekwipunek[Position]!= -1:
		Input.set_custom_mouse_cursor(buttons[Position].get_node("TextureRect").texture,0,Vector2(100,100))
		GlobalInput.Active_Item = GlobalItems.Ekwipunek[Position]
	else:
		Input.set_custom_mouse_cursor(null)
	pass
	# Replace with function body.
