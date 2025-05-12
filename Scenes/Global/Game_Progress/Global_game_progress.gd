extends Node
# zapis wszystkich zagadek i elementów które wymagają zapisania stanu
var Progress :={
	"klucz_w_lodówce" = false,
}

# enum wszystkich lokacji
enum Location {
	Lokacja_testowa
}

var Current_Location :Location

# Dictionary z wszystkimi lokacjami zależnymi od enuma
var Locations_dict ={
	Location.Lokacja_testowa:load('res://Scenes/Locations/AlphaLocations/livingRoom.tscn'),
}
