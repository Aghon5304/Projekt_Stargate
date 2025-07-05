#extends Node
#
#const NotebookScene = preload("res://Scenes/Menus/notebook/notatnik.tscn")
#@onready var notebook: Control = NotebookScene.instantiate()
#
#var is_notebook_being_opened = false  # Flaga, aby kontrolować moment nadania focusu
#
#func _ready():
	#add_child(notebook)
	#notebook.position = Vector2(5000, 5000)  # ukrywamy
	#GlobalSignals.is_notebook_open = false  # <- dodaj sobie ten sygnał/zmienną w GlobalSignals.gd
#
#func _input(event):
	## Sprawdzamy, czy użytkownik nacisnął przycisk "toggle_notebook"
	#if event is InputEvent and Input.is_action_just_pressed("toggle_notebook"):
		#_toggle_notebook()
#
#func _toggle_notebook():
	#if GlobalSignals.is_notebook_open:
		## Sprawdzamy, czy PageEdit nie ma focusu przed zamknięciem
		#if notebook.page_edit != null and not notebook.page_edit.has_focus():
			#notebook.position = Vector2(5000, 5000)
			#Engine.time_scale = 1
			#GlobalSignals.is_notebook_open = false
	#else:
		## Otwieramy notatnik
		#notebook.position = Vector2(0, 0)
		#Engine.time_scale = 0
		#is_notebook_being_opened = true  # Ustawiamy flagę, by zablokować moment wpisywania
		#if notebook.page_edit != null:
			## Opóźniamy nadanie focusu do następnej klatki
			#await get_tree().create_timer(0.0).timeout  # Czekamy na zakończenie aktualnej klatki
			#notebook.page_edit.grab_focus()  # Nadajemy focus po opóźnieniu
		#GlobalSignals.is_notebook_open = true
#
#func _process(delta):
	## Resetujemy flagę po nadaniu focusu
	#if is_notebook_being_opened and notebook.page_edit.has_focus():
		#is_notebook_being_opened = false
