extends Node


var _player_respawn := Vector3.ZERO

onready var _cubes_label := $UI/CubesLabel


func _on_bottom_body_entered(body: Node) -> void:
	body.translation = _player_respawn
	body.reset_camera()


func _on_cube_obtained(pos: Vector3) -> void:
	_cubes_label.text = "Cubes: %s" % $Player.num_cubes
	_player_respawn = pos
