extends CharacterBody3D

@export var mouse_sensitivity = 0.001
var SPEED = 5.0
@export var run_speed = 2
@export var walk_speed = 1
@export var FRICTION = 0.01
const JUMP_VELOCITY = 2

var pages_collected = 0


@onready var ray = $Camera3D/RayCast3D
@onready var interaction_notifier = $Control/InteractionNotifier
@onready var collection_tracker = $Control/MarginContainer/CollectionTracker





# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED



func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x, -1.2, 1.2)





func check_ray_hit():
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider and ray.get_collider().is_in_group("Pickup"):
			interaction_notifier.visible = true
		if Input.is_action_just_pressed("use"):
			ray.get_collider().queue_free()
			pages_collected += 1
			collection_tracker.text = "Pages : " + str(pages_collected) + " /10"
	else:
		interaction_notifier.visible = false

func _physics_process(delta):
	check_ray_hit()
	if Input.is_action_pressed("run"):
		SPEED = run_speed
	else:
		SPEED = walk_speed

	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# Replace UI actions with custom gameplay actions for WASD movement along with arrows.
	var input_dir = Input.get_vector("ui_a", "ui_d", "ui_w", "ui_s")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * SPEED, FRICTION)
		velocity.z = move_toward(velocity.z, direction.z * SPEED, FRICTION)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
