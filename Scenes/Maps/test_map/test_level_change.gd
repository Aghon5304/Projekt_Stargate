extends Area3D

#nazwa skryptuwyszla z tego ze po wejsciu na kafelek razem ze zmiana meshu i 
#postaci gracza zmiania sie scena. Bede musial zmienic te nazwe

func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		body.tutorial = false
		body.update_appearance()
