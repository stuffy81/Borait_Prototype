extends Area3D
class_name TargetDetector

var target : CharacterBody3D

func _on_target_entered(body: Node3D) -> void:
	if body != get_parent() and body is CharacterBody3D:
		target = body

func _on_target_exited(body: Node3D) -> void:
	if body != get_parent() and body is CharacterBody3D:
		target = null
