extends CanvasLayer


@onready var pausemenu_456 = $pausemenu456

# Called when the node enters the scene tree for the first time.
func _ready():
	set_visible(false) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	if Input.is_action_pressed("ui_cancel"):
		pausemenu_456.visible = true
		get_tree().paused = true
		
	
#func set_visible(is_visible):
	#for node in get_children():
		#node.visible = is_visible

func _on_resume_button_pressed():
	pausemenu_456.visible = false
	get_tree().paused = false

func _on_quit_button_2_pressed():
	get_tree().quit()
	
