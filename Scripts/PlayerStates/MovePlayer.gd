class_name MovePlayer extends PlayerBase

func _on_process(delta):
	var axis = _get_axis()
	var target_rotation = atan2(axis.x, axis.y)

	if axis.length() > 0:
		player.velocity.x = axis.x * player.properties_characters.speed * delta
		player.velocity.z = axis.y * player.properties_characters.speed * delta
		player.rotation.y = target_rotation
	else:
		player.velocity.x = 0.0
		player.velocity.z = 0.0
		state_machine._change_state(player.states_bases.IDLE)

	player.move_and_slide()
