extends Control

@onready var page_edit = $PageContainer/PageEdit
@onready var page_label = $PageNumber
@onready var prev_btn = $PrevPageBtn
@onready var next_btn = $NextPageBtn

var pages = []
var current_page = 0
const MAX_CHARS = 1000

func _ready():
	if pages.is_empty():
		pages.append("")
	_update_page()

	prev_btn.pressed.connect(_on_prev_pressed)
	next_btn.pressed.connect(_on_next_pressed)

func _on_prev_pressed():
	_save_current()
	if current_page > 0:
		current_page -= 1
		_update_page()

func _on_next_pressed():
	_save_current()
	if current_page == pages.size() - 1:
		pages.append("")
	current_page += 1
	_update_page()

func _save_current():
	var txt = page_edit.text
	if txt.length() > MAX_CHARS:
		txt = txt.substr(0, MAX_CHARS)
	pages[current_page] = txt

func _update_page():
	page_edit.text = pages[current_page]
	page_label.text = "Strona %d / %d" % [current_page + 1, pages.size()]

func _on_page_texture_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		page_edit.release_focus()
