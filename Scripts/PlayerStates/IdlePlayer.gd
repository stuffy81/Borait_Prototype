class_name IdlePlayer extends PlayerBase

func _enter():
	_run_animations(player.animation_player, player.animations_bases.IDLE)

func _exit():
	pass

func _on_process(delta):
	if _get_axis().length() > 0:
		state_machine._change_state(player.states_bases.MOVE)
