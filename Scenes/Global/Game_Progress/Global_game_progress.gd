extends Node
# zapis wszystkich zagadek i elementów które wymagają zapisania stanu
var Progress :={
	"klucz_w_lodówce" = false,
}

# enum wszystkich lokacji
enum Location {
	Lokacja_testowa,
	Motel_outdoors,
	Motel_reception,
}

var Current_Location :Location

# Dictionary z wszystkimi lokacjami zależnymi od enuma
var Locations_dict ={
	Location.Lokacja_testowa:load('res://Scenes/Locations/AlphaLocations/livingRoom.tscn'),
	Location.Motel_outdoors:load("res://Scenes/Locations/Motel_outdors/Motel_parking.tscn"),
	Location.Motel_reception:load("res://Scenes/Locations/Motel_Reception/motel_reception.tscn")
}
