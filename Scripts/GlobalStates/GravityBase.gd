class_name GravityBase extends StateBase

var body : CharacterBody3D:
	set(value):
		controlled_node = value
	get :
		return controlled_node

func _handled_gravity(delta):
	if not body.is_on_floor():
		body.velocity += body.get_gravity() * delta
