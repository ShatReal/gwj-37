extends StaticBody


signal cube_obtained(pos)

var is_attached := false

onready var _start_pos := translation


func _on_area_body_entered(body: Node) -> void:
	if not is_attached:
		yield(get_tree(), "idle_frame")
		get_parent().remove_child(self)
		body.add_child(self)
		body.num_cubes += 1
		translation = Vector3(0, 0, 3) * body.num_cubes
		is_attached = true
		emit_signal("cube_obtained", _start_pos)
