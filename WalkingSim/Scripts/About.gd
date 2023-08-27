extends MarginContainer

@onready var selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector_one
@onready var selector_two = $CenterContainer/VBoxContainer/CenterContainer3/VBoxContainer/CenterContainer/HBoxContainer/selector_two
@onready var selector_three=$CenterContainer/VBoxContainer/CenterContainer4/VBoxContainer/CenterContainer/HBoxContainer/selector_three

var current_selection = 0

func _ready():
	set_current_selection(0)
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func set_current_selection(_current_selection):
	selector_one.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	
