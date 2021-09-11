extends StaticBody


export(Vector3) var _direction
export(float) var _distance
export(float) var _speed

var _going_towards := true

onready var _start_translation := translation


func _physics_process(delta: float) -> void:
	if _start_translation.distance_to(translation) >= _distance:
		_going_towards = not _going_towards
	if _going_towards:
		translation += _direction * _speed * delta
	else:
		translation += -_direction * _speed * delta
		
