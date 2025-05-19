class_name AttackeMeleePlayer extends PlayerBase

var enemie : CharacterBody3D

var array_anims = [
	player.animations_player.ATTACK_MELEE_1,
	player.animations_player.ATTACK_MELEE_2,
	player.animations_player.ATTACK_MELEE_3
]

var used_anims = []

func _enter():
	_connect_signals(player.animation_player, _finish_attack, "animation_finished")
	_impulse_to_attack()

func _finish_attack(anim_name):
	if anim_name == player.animations_player.ATTACK_MELEE:
		state_machine._change_state(player.states_bases.IDLE)

func _impulse_to_attack():
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)

	if enemie:
		var direction = enemie.global_position - player.global_position
		player.rotation.y = atan2(direction.x , direction.z)

	var impulse = player.properties_attack.impulse_attack
	var speed_tween = player.properties_characters.speed_tween
	var impulse_direction = (player.get_global_transform().basis.z * impulse)  + player.global_position
	tween.tween_property(player, 'global_position', impulse_direction, speed_tween)

func _handled_anim():
	var anim_name

	for anim in array_anims:
		pass

func target_entered(body: Node3D):
	if body != player:
		enemie = body

func target_exited(body: Node3D):
	if body != player:
		enemie = null
