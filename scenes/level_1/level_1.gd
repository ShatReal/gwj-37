extends Node



func _on_bottom_body_entered(body: Node) -> void:
	body.translation = Vector3.ZERO
	body.reset_camera()
	var offset = 5
	for cube in get_tree().get_nodes_in_group("cube"):
		if cube.is_attached:
			cube.translation = Vector3(0, 0, offset)
			offset += 5
