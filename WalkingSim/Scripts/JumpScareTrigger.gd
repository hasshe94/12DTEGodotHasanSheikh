#extends Area3D
#
#var jump_scare_entity = preload("res://epstein.tscn")
#var triggered = false
#
#var scream: AudioStreamPlayer3D
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#
#
#func _on_body_entered(body):
#	if body.is_in_group("Player") and not triggered:
#		triggered = true
#		print("Create the jumpscare")
#		AudioStreamPlayer3D.play()
#		var epstein = jump_scare_entity.instantiate()
#		epstein.global_position = $Marker3D.global_position
#		get_parent().add_child(epstein)

extends Area3D

var jump_scare_entity = preload("res://Scenes/epstein.tscn")
var triggered = false

var scream: AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready():
	scream = $AudioStreamPlayer3D  # Replace with the actual path to your AudioStreamPlayer3D node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.is_in_group("Player") and not triggered:
		triggered = true
		print("Create the jumpscare")
		
		if scream:
			scream.play()  # Play the audio jumpscare
			
		var epstein = jump_scare_entity.instantiate()  # Use instance() instead of instantiate()
		epstein.global_position = $Marker3D.global_position
		get_parent().add_child(epstein)
