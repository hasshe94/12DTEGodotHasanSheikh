extends Node3D

var move_speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector3.FORWARD * delta * move_speed)


func _on_timer_timeout():
	queue_free()
