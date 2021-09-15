extends Node


var _player_respawn := Vector3.ZERO
var _won := false

onready var _cubes_label := $UI/TopLeft/CubesLabel
onready var _time_label := $UI/TopLeft/TimeLabel
onready var _start_time := OS.get_ticks_msec()


func _ready() -> void:
	pass
#	$Player.num_cubes = 4
#	$Player.translation = $Cubes/Cube5.translation


func _process(_delta: float) -> void:
	if not _won:
		var dif = OS.get_ticks_msec() - _start_time
		dif = dif / 1000
		var h = dif / 3600
		var m = dif % 3600 / 60
		var s = dif % 3600 % 60
		_time_label.text = "Time: %02d:%02d:%02d" % [h, m, s]


func _on_bottom_body_entered(body: Node) -> void:
	body.translation = _player_respawn
	body.get_node("Death").play()
#	body.reset_camera()


func _on_cube_obtained(pos: Vector3) -> void:
	_cubes_label.text = "Cubes: %s" % $Player.num_cubes
	_player_respawn = pos


func _on_goal_body_entered(_body: Node) -> void:
	if $Player.num_cubes >= 5:
		$UI/Win.show()
		_won = true
		$Win.play()
