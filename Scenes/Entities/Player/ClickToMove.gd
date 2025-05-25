extends CharacterBody3D
@onready var main_game_mesh: Node3D = $MainGameProt
@onready var tutorial_mesh: MeshInstance3D = $TutorialMesh
@onready var navigationAgent : NavigationAgent3D = $NavigationAgent3D
@onready var Gui: Node = $"../gui"
var Speed = 5
var end_position :Vector3
var tutorial = false #Okreslamy czy tutorial trwa czy sie skonczyl
#i na jego podstawie ustawiamy skorke ziomka
# Called when the node enters the scene tree for the first time.
func _ready():
	update_appearance()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta: float) -> void:
	if !navigationAgent.is_navigation_finished():
		moveToPoint(delta, Speed)
	pass


func moveToPoint(_delta, speed):
	var targetPos = navigationAgent.get_next_path_position()
	var direction = global_position.direction_to(targetPos)
	faceDirection(targetPos)
	velocity = direction * speed
	move_and_slide()

func faceDirection(direction):
	look_at(Vector3(direction.x, global_position.y, direction.z), Vector3.UP)
	pass

#sprawdzanie czy nie zostało coś wciśnięte
func _input(_event):
	if Input.is_action_just_pressed("LeftMouse"):
		var Ekwipunek : Control = get_parent().get_node("Equipment/ObramowanieEkwipunku")
		
		#jeżeli wciśnięto lewy przycisk oraz nie został naciśnięty ekwipunek:
		if (not Ekwipunek.get_global_rect().has_point(get_viewport().get_mouse_position()) or not Ekwipunek.get_parent().is_visible()):
			for x in Gui.get_children():
				if x.get_global_rect().has_point(get_viewport().get_mouse_position()):
					return
			#camera = pierwsza kamera w scenie
			var camera = get_tree().get_nodes_in_group("Cameras")[0]
			# sprawdzenie pozycji myszki na ekranie i wystrzelenie rayu o długości 100 w stronę myszki
			var mousePos = get_viewport().get_mouse_position()
			var rayLength = 10000
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
				navigationAgent.target_position.y = position.y
			GlobalInput.Last_clicked = null
			

func update_appearance():
		main_game_mesh.visible = not tutorial
		tutorial_mesh.visible = tutorial


func _on_monologue_object_signal_bohater_monolog(dialog: String) -> void:
	pass # Replace with function body.


func _on_navigation_agent_3d_navigation_finished() -> void:
	GlobalSignals.Item_used.emit()
	pass # Replace with function body.

#Obsługa wejścia do bramy
func _on_entry_camera_area_entered(area: Area3D) -> void:
	if(area.is_in_group("Player")):
		var activeCamera = get_viewport().get_camera_3d();
		if(activeCamera.name!="CameraGuardBooth"):
			$Cameras/CameraGuardBooth.current = true
			CharacterBody3D.position=Vector3(19.559,1.852,-56.08)

			
#Obsługa powrotu do bramy
func _on_back_to_gate_area_entered(area: Area3D) -> void:
	if(area.is_in_group("Player")):
		var activeCamera = get_viewport().get_camera_3d();
		if(activeCamera.name!="CameraGuardBooth"):
			$Cameras/CameraGuardBooth.current = true
			CharacterBody3D.position=Vector3(19.559,1.852,-56.08)
#Obsługa Wejścia Do Bunkra
func _on_to_bunker_area_entered(area: Area3D) -> void:
	if(area.is_in_group("Player")):
		var activeCamera = get_viewport().get_camera_3d();
		if(activeCamera.name=="CameraWorldView"):
			$Cameras/CameraBunker.current = true
			CharacterBody3D.position=Vector3(-4.233,2.515,-66.14)
		#Obsługa Wyjścia Z Bunkra
		if(activeCamera.name=="CameraBunker"):
			$"../Cameras/CameraWorldView".current = true
			CharacterBody3D.position=Vector3(-4.233,2.142,-56.78)

#Obsługa Wejścia na kraniec Lasu
func _on_to_end_of_forest_area_entered(area: Area3D) -> void:
	if(area.is_in_group("Player")):
		var activeCamera = get_viewport().get_camera_3d();
		if(activeCamera.name == "CameraWorldView"):
			$"../Cameras/CameraForest".current = true
			CharacterBody3D.position=Vector3(-43.98,2.547,-57.98)
#Obsługa wyjścia z lasu
func _on_to_world_view_from_the_end_area_entered(area: Area3D) -> void:
	if(area.is_in_group("Player")):
		var activeCamera = get_viewport().get_camera_3d();
		if(activeCamera.name == "CameraForest"):
			$"../Cameras/CameraWorldView".current = true
			CharacterBody3D.position=Vector3(-33.54,2.468,-57.98)

#Obsługa wejścia przez bramę
