extends Area3D
class_name TargetDetector

var target : CharacterBody3D
var object : Dictionary = {
	"attack_properties": null ,
	"name_object": null
}

func _on_target_entered(body: Node3D) -> void:
	if body != get_parent():
		if body is CharacterBody3D:
			target = body
		elif body is ObjectInteractable:
			object["attack_properties"] = body.attack_properties
			object["name_object"] = str(body.name)
			body.queue_free()

func _on_target_exited(body: Node3D) -> void:
	if body != get_parent() and body is CharacterBody3D:
		target = null
