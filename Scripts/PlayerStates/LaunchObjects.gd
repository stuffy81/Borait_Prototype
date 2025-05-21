class_name LaunchObjects extends PlayerBase

func _enter():
	_connect_signals(player.animation_player, _finish_launch, "animation_finished")
	_run_animations(player.animation_player , player.animations_player.LAUNCH_OBJECTS)
	_spawn_and_impulse_object()

func _finish_launch(anim_name):
	state_machine._change_state(player.states_bases.IDLE)

func _spawn_and_impulse_object():
	var dictionary_object = player.Target_Detector.object

	if dictionary_object.has("path"):
		var object = load(dictionary_object["path"])
		var instance = object.instantiate()
		get_tree().root.add_child(instance)
		(instance as ObjectInteractable).global_position = player.shoot_position.global_position
		(instance as ObjectInteractable).remove_from_group("ObjectLaunchable")
		player.Target_Detector.object.clear()
