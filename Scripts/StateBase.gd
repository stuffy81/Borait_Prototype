class_name StateBase extends Node

var controlled_node : Node
var state_machine : StateMachine 

func _enter():
	pass

func _exit():
	pass

func _run_animations(animation_player : AnimationPlayer, name_anim : String):
	if animation_player and animation_player.has_animation(name_anim):
		animation_player.play(name_anim)

func _connect_signals(node : Node , method , signal_name : String):
	if not node.is_connected(signal_name, method):
		node.connect(signal_name, method)
