extends CharacterBody3D
class_name Player

@export var properties_characters : PropertiesCharacters = PropertiesCharacters.new()
@export var properties_attack : AttackProperties = AttackProperties.new()

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var Target_Detector : TargetDetector = $TargetDetector
@onready var shoot_position : Node3D = $ShootPosition

var animations_bases : AnimationsCommons = AnimationsCommons.new()
var animations_player : AnimationsPlayer = AnimationsPlayer.new()
var states_bases : StatesCommons = StatesCommons.new()
var states_player : StatesPlayer = StatesPlayer.new()
