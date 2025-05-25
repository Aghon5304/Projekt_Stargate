extends Node3D

var ItemId = GlobalItems.ItemTypes.PRZEPUSTKA

func _ready():
	for i in range(GlobalItems.Ekwipunek.size()):
		if GlobalItems.Ekwipunek[i] == -1:
			GlobalItems.Ekwipunek[i] = ItemId
			break
