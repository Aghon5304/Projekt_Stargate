extends GridContainer
@export var Icons : Array[Texture2D] = []
@export	 var NoIcon : Texture2D = preload("res://Assets/Images/icon.svg")
@onready var buttons := get_children()
func _ready() -> void:
	Icons.resize(GlobalItems.ItemTypes.size())
	Icons[GlobalItems.ItemTypes.LATARKA] = preload("res://Assets/Images/icon.svg")
	Icons[GlobalItems.ItemTypes.PISTOLET] = preload("res://Assets/Images/icon.svg")
	Icons[GlobalItems.ItemTypes.NOTATNIK] = preload("res://Assets/Images/icon.svg")
	for x in buttons.size():
		buttons[x].button_number = x
		if GlobalItems.Ekwipunek[x]!= null:
			buttons[x].icon = Icons[GlobalItems.Ekwipunek[x]]
		else:
			buttons[x].icon = NoIcon
func OnEkwipunekChang() ->void:
	for x in buttons.size():
		if GlobalItems.Ekwipunek[x]!= null:
			buttons[x].icon = Icons[GlobalItems.Ekwipunek[x]]
		else:
			buttons[x].icon = NoIcon
