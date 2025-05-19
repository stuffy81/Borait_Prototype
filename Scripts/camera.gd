class_name Camera extends Node3D

@export var target : Node3D 

func _process(delta: float) -> void:
	if target:
		global_position.x = target.global_position.x 
		global_position.z = target.global_position.z
