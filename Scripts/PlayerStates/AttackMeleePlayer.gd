class_name AttackeMeleePlayer extends PlayerBase

var enemie : CharacterBody3D
var properties : AttackProperties = AttackProperties.new()

var array_anims = [
	player.animations_player.ATTACK_MELEE_1,
	player.animations_player.ATTACK_MELEE_2,
	player.animations_player.ATTACK_MELEE_3
]

var used_anims = []

func _on_unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ATTACK_MELEE"):

		_rot_to()
		_impulse_to_attack()
		_attack_character()
		_handled_anim()

func _enter():
	_get_enemie()
	_get_properties()
	_connect_signals(player.animation_player, _finish_attack, "animation_finished")

	_rot_to()
	_impulse_to_attack()
	_attack_character()
	_handled_anim()

func _exit():
	used_anims.clear()

func _on_process(delta):
	_get_enemie()

func _get_enemie():
	enemie = player.Target_Detector.target

func _get_properties():
	if player.Target_Detector.object["attack_properties"]:
		properties = player.Target_Detector.object["attack_properties"]

func _finish_attack(anim_name):
	state_machine._change_state(player.states_bases.IDLE)

func _attack_character():
	if enemie:
		var impulse = player.get_global_transform().basis.z.normalized() * properties.impulse_to_target
		var direction_to = impulse + enemie.global_position
		_impulse_character(enemie , Vector3(direction_to.x, player.global_position.y , direction_to.z))

func _impulse_to_attack():
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

	var impulse = player.properties_characters.impulse_attack
	var speed_tween = player.properties_characters.speed_tween
	var impulse_direction = (player.get_global_transform().basis.z * impulse)  + player.global_position
	tween.tween_property(player, 'global_position', impulse_direction, speed_tween)

func  _impulse_character(node, direction):
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

	var speed_tween = player.properties_characters.speed_tween
	tween.tween_property(node, "global_position", direction, speed_tween)

func _handled_anim():

	for anim in array_anims:
		if not anim in used_anims:
			_run_animations(player.animation_player , anim)
			used_anims.append(anim)
			break

	if used_anims.size() == array_anims.size():
		used_anims.clear()

func _rot_to():
	var rot 
	var target_rotation

	if enemie:
		var direction = enemie.global_position - player.global_position
		target_rotation = atan2(direction.x , direction.z)
	else:
		var axis = _get_axis()
		target_rotation = atan2(axis.x , axis.y)

	if target_rotation:
		rot = target_rotation

	if rot:
		player.rotation.y = rot
