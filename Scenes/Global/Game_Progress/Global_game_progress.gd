extends Node
# zapis wszystkich zagadek i elementów które wymagają zapisania stanu
var Progress :={
	"klucz_w_lodówce" = false,
	"Motel_pierwsza_pani_od_fishcoli" = false,
	"Motel_dano_fishcole" = false,
	"Motel_Fishcola_pickup" = false,
	"Forest_Trash_pick_up" = false,
	"Motel_Notebook_pickup" = false,
}

# enum wszystkich lokacji
enum Location {
	Lokacja_testowa,
	Motel_outdoors,
	Motel_reception,
	Forest,
	transition_to_motel
}

var Current_Location :Location

# Dictionary z wszystkimi lokacjami zależnymi od enuma
var Locations_dict ={
	Location.Lokacja_testowa:load('res://Scenes/Locations/AlphaLocations/livingRoom.tscn'),
	Location.Motel_outdoors:load("res://Scenes/Locations/Motel_outdors/Motel_parking.tscn"),
	Location.Motel_reception:load("res://Scenes/Locations/Motel_Reception/motel_reception.tscn"),
	Location.Forest:load("res://Scenes/Locations/Forest/forest_location.tscn"),
	Location.transition_to_motel:load("res://Scenes/Locations/Motel_outdors/tranasition.tscn")
}
