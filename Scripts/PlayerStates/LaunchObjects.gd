class_name LaunchObjects extends PlayerBase

func _on_unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_released("LAUNCH_OBJECTS"):
		state_machine._change_state(player.states_bases.MOVE)

func _on_process(delta):
	var axis = _get_axis()
	var speed = player.properties_characters.speed_with_object

	if axis.length() > 0:
		var direction = (player.transform.basis.z + Vector3(axis.x,0,axis.y)) * speed * delta
		player.velocity.z = direction.z
		player.velocity.x = direction.x
	else:
		player.velocity.z = 0
		player.velocity.x = 0

	player.move_and_slide()

	_rotate_pointing(player.properties_characters.speed_rotation , delta)

func _rotate_pointing(speed , delta):
	if _get_axis().x != 0:
		player.rotation.y += _get_axis().x * speed * delta
