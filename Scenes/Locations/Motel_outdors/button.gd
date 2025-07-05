extends TextureButton
var ItemId = GlobalItems.ItemTypes.NOTATNIK
@onready var transition_screen: AnimationPlayer = $"../../Transition_screen/AnimationPlayer"
@onready var texture_rect: TextureRect = $"../TextureRect"
var NoNotebook :Texture2D = preload("res://Assets/Images/Motel/Inside_Without_Notebook.png")
var kliknięto := false
func _ready() -> void:
	if GlobalGameProgress.Progress["Motel_Notebook_pickup"] == true:
		texture_rect.texture = NoNotebook

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
				texture_rect.texture = NoNotebook
				self.visible = false
				GlobalGameProgress.Progress["Motel_Notebook_pickup"] = true
				GlobalSignals.Item_used.emit()
				return
	#jeżeli masz pełny ekwipunkek to wypisuje wiadomość
	print("masz za duzo itemów w eq")
	pass # Replace with function body.
