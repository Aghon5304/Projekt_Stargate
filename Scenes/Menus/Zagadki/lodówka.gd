extends Button
var ItemId = GlobalItems.ItemTypes.KLUCZ_W_LODZIE
@onready var texture_rect: TextureRect = $"../TextureRect"
var lodowka_bez_lodu :Texture2D
func _ready() -> void:
	if GlobalZagadkiState.klucz_w_lodówce == true:
		texture_rect.texture = lodowka_bez_lodu

func _on_pressed() -> void:
	for item in GlobalItems.Ekwipunek.size():
		if self.visible == true:
			#jeżeli pole jest puste (-1) to zamienia je na ItemId (enum przedmiotu)
			if GlobalItems.Ekwipunek[item] == -1:
				GlobalItems.Ekwipunek[item] = ItemId
				#przedmiot staje się niewidzalny oraz colishion shape się wyłącza aby symulować podniesienie
				texture_rect.texture = lodowka_bez_lodu
				GlobalZagadkiState.klucz_w_lodówce = true
				GlobalSignals.Item_used.emit()
				return
	#jeżeli masz pełny ekwipunkek to wypisuje wiadomość
	print("masz za duzo itemów w eq")
	pass # Replace with function body.
