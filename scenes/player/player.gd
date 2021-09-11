extends KinematicBody


const MOVE_SPEED := 20
const JUMP_FORCE := 40
const GRAVITY := 75
const MAX_FALL_SPEED := 30
const H_LOOK_SENS = 1.0
const V_LOOK_SENS = 1.0

var velocity := Vector3.ZERO
var last_cube: RigidBody

onready var cam = $CamPivot


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		cam.rotation_degrees.x -= event.relative.y * V_LOOK_SENS
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, 90)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif event.is_action_pressed("click") and Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().set_input_as_handled()
		

func _physics_process(delta: float) -> void:
	var input_vector := Vector3()
	if Input.is_action_pressed("forward"):
		input_vector.z -= 1
	if Input.is_action_pressed("back"):
		input_vector.z += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	input_vector = input_vector.normalized().rotated(Vector3.UP, rotation.y)
	velocity.x = input_vector.x * MOVE_SPEED
	velocity.z = input_vector.z * MOVE_SPEED
	velocity.y -= GRAVITY * delta
	if velocity.y < -MAX_FALL_SPEED:
		velocity.y = -MAX_FALL_SPEED
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y += JUMP_FORCE
	
	velocity = move_and_slide(velocity, Vector3.UP)
	

func reset_camera() -> void:
	cam.rotation_degrees.x = -20
	rotation.y = 0
