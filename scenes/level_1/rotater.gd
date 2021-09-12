extends KinematicBody


export(float) var _rot_speed := 0.5


func _physics_process(delta: float) -> void:
	rotation.z += _rot_speed * delta
