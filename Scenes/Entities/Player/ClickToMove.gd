extends CharacterBody3D

@onready var main_game_mesh: MeshInstance3D = $MainGameMesh
@onready var tutorial_mesh: MeshInstance3D = $TutorialMesh
@onready var navigationAgent : NavigationAgent3D = $NavigationAgent3D

var Speed = 5
var tutorial = true #Okreslamy czy tutorial trwa czy sie skonczyl
#i na jego podstawie ustawiamy skorke ziomka
# Called when the node enters the scene tree for the first time.
func _ready():
	update_appearance()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(navigationAgent.is_navigation_finished()):
		return
	
	moveToPoint(delta, Speed)
	pass


func moveToPoint(_delta, speed):
	var targetPos = navigationAgent.target_position
	var direction = global_position.direction_to(targetPos)
	faceDirection(targetPos)
	velocity = direction * speed
	move_and_slide()

func faceDirection(direction):
	look_at(Vector3(direction.x, global_position.y, direction.z), Vector3.UP)

#sprawdzanie czy nie zostało coś wciśnięte
func _input(_event):
	if Input.is_action_just_pressed("LeftMouse"):
		var Ekwipunek : Control = get_parent().get_node("Equipment/ObramowanieEkwipunku")
		#jeżeli wciśnięto lewy przycisk oraz nie został naciśnięty ekwipunek:
		if (not Ekwipunek.get_global_rect().has_point(get_viewport().get_mouse_position()) or not Ekwipunek.get_parent().is_visible()):
			#camera = pierwsza kamera w scenie
			var camera = get_tree().get_nodes_in_group("Cameras")[0]
			# sprawdzenie pozycji myszki na ekranie i wystrzelenie rayu o długości 100 w stronę myszki
			var mousePos = get_viewport().get_mouse_position()
			var rayLength = 100
			var from = camera.project_ray_origin(mousePos)
			var to = from + camera.project_ray_normal(mousePos) * rayLength
			var space = get_world_3d().direct_space_state
			var rayQuery = PhysicsRayQueryParameters3D.new()
			#jeżeli coś zostanie trafione to tworzony jest punkt na nav meshu do którego porusza się gracz, Dla pewności że gracz nie spróbuje sie poruszyć "w gracza"
			#zmieniono collision mask rayu aby nie interaktował z graczem
			rayQuery.collision_mask = 4
			rayQuery.from = from
			rayQuery.to = to
			rayQuery.collide_with_areas = true
			var result = space.intersect_ray(rayQuery)
			if (result != {} ):
				navigationAgent.target_position = result.position
				GlobalSignals.Item_used.emit()

func update_appearance():
		main_game_mesh.visible = not tutorial
		tutorial_mesh.visible = tutorial
