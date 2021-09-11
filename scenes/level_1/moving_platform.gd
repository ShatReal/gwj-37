extends KinematicBody


export(Vector3) var _direction
export(float) var _distance
export(float) var _speed

var _going_towards := true
var _vel := Vector3.ZERO

onready var _start_translation := translation


func _physics_process(delta: float) -> void:
	if _start_translation.distance_to(translation) >= _distance:
		_going_towards = not _going_towards
	if _going_towards:
		_vel = move_and_slide(_direction * _speed)
	else:
		_vel = move_and_slide(-_direction * _speed)
		
