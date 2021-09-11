extends RigidBody


var is_attached := false


func _on_area_body_entered(body: Node) -> void:
	if not is_attached:
		translation = body.translation + Vector3(0, 0, 5)
		var joint := PinJoint.new()
		get_parent().add_child(joint)
		if body.last_cube:
			joint.set("nodes/node_a", body.last_cube.get_path())
		else:
			joint.set("nodes/node_a", body.get_path())
		joint.set("nodes/node_b", get_path())
		is_attached = true
