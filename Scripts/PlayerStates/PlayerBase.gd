class_name PlayerBase extends GravityBase

var player : Player:
	set(value):
		controlled_node = value
	get:
		return controlled_node

func _get_axis() -> Vector2:
	var axis = Input.get_vector("ui_left","ui_right","ui_down","ui_up")
	return axis

func _on_unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ATTACK_MELEE"):
		state_machine._change_state(player.states_player.ATTACK_MELEE)
