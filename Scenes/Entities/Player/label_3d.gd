extends Label3D

var scaling := false
var camera : Camera3D
var distance := 0

func _ready() -> void:
	GlobalSignals.connect("Bohater_monolog",monologue)
	
func _process(delta: float) -> void:
	if scaling:
		if camera == null:
			camera = get_tree().get_nodes_in_group("Cameras")[0]
		# obracamy tekst w stronę kamery
		distance = camera.position.distance_to(self.position)
		font_size = 32*distance/15
func monologue(monolog : String):
	scaling = true
	self.text = monolog
	# czekamy 3 sekundy po czym usuwamy tekst
	await get_tree().create_timer(3).timeout 
	self.text = ""
	scaling = false
