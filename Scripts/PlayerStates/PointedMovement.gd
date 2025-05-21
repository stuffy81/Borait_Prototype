class_name PointedMovement extends PlayerBase

func _on_process(delta: float) -> void:
	var axis = _get_axis()
	var speed = player.properties_characters.speed_anormal
	var direction = axis * speed * delta

	if axis.x != 0:
		player.rotation.y += axis.x * player.properties_characters.speed_rotation * delta 

	if axis.y != 0:
		player.velocity.x = direction.x
		player.velocity.z = direction.y
	else:
		player.velocity.x = 0.0
		player.velocity.z = 0.0

	player.move_and_slide()
