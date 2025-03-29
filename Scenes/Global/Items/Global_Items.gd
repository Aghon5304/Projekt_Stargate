extends Node
var Ekwipunek := [-1,-1,-1,-1,-1,-1,-1,-1]
enum ItemTypes {
	LATARKA,
	PISTOLET,
	NOTATNIK,
	PISTOLET_Z_LATARKA
}
#[item nr 1 , item nr 2 , wynik]
var Crafting := {
	Vector2(ItemTypes.LATARKA,ItemTypes.LATARKA): ItemTypes.PISTOLET,
	Vector2(ItemTypes.LATARKA,ItemTypes.PISTOLET): ItemTypes.NOTATNIK,
}
