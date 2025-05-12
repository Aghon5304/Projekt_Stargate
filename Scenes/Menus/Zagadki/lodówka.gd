extends TextureButton
var ItemId = GlobalItems.ItemTypes.KLUCZ_W_LODZIE
@onready var transition_screen: AnimationPlayer = $"../../Transition_screen/AnimationPlayer"
@onready var texture_rect: TextureRect = $"../TextureRect"
var lodowka_bez_lodu :Texture2D = preload("res://Assets/Images/Fridge_Inside_Empty.png")
var kliknięto := false
func _ready() -> void:
	if GlobalGameProgress.progress["klucz_w_lodówce"] == true:
		texture_rect.texture = lodowka_bez_lodu

func _on_pressed() -> void:
	for item in GlobalItems.Ekwipunek.size():
		if self.visible == true and !kliknięto:
			#jeżeli pole jest puste (-1) to zamienia je na ItemId (enum przedmiotu)
			if GlobalItems.Ekwipunek[item] == -1:
				GlobalItems.Ekwipunek[item] = ItemId
				#przedmiot staje się niewidzalny oraz colishion shape się wyłącza aby symulować podniesienie
				kliknięto = true
				transition_screen.play("fade_to_black")
				await transition_screen.animation_changed
				texture_rect.texture = lodowka_bez_lodu
				self.visible = false
				GlobalZagadkiState.klucz_w_lodówce = true
				GlobalSignals.Item_used.emit()
				return
	#jeżeli masz pełny ekwipunkek to wypisuje wiadomość
	print("masz za duzo itemów w eq")
	pass # Replace with function body.
