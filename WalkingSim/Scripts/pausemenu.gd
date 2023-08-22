extends CanvasLayer

@onready var pausemenu_456 = $pausemenu456

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	set_visible(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	if Input.is_action_just_pressed("ui_cancel"):
		pausemenu_456.visible = true
		get_tree().paused = true
		if pausemenu_456.visible == true and Input.is_action_just_pressed("ui_cancel"):
			pausemenu_456.visible = false
			
			


func _on_resume_button_pressed():
	pausemenu_456.visible = false
	get_tree().paused = false



func _on_quit_button_2_pressed():
	get_tree().quit()

