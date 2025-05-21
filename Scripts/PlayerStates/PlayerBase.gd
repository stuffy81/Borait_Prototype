class_name PlayerBase extends GravityBase

var player : Player:
	set(value):
		controlled_node = value
	get:
		return controlled_node

func _get_axis() -> Vector2:
	var axis = Input.get_vector("ui_right","ui_left","ui_down","ui_up")
	return axis

func _on_unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ATTACK_MELEE") and not str(state_machine.current_states.name) == player.states_player.POINTED_MOVEMENT:
		state_machine._change_state(player.states_player.ATTACK_MELEE)
	if event.is_action_pressed("LAUNCH_OBJECTS") and player.Target_Detector.object.size() > 0:
		state_machine._change_state(player.states_player.POINTED_MOVEMENT)
	if event.is_action_released("LAUNCH_OBJECTS") and player.Target_Detector.object.size() > 0:
		state_machine._change_state(player.states_player.LAUNCH_OBJECTS)
