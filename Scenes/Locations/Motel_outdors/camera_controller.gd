extends Node3D
@onready var gracz: CharacterBody3D = $".."

func _physics_process(delta: float) -> void:
	#przesunięcie kamery za graczem
	position.z = gracz.position.z
	position.x = gracz.position.x
