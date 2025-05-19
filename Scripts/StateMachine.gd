class_name StateMachine extends Node

@onready var controlled_node : Node = self.owner

@export var state_initial : StateBase

var states = {}

var current_states : StateBase

func _ready() -> void:
	call_deferred("_save_states")
	call_deferred("_init_machine")

func _save_states():
	for state in get_children():
		states[str(state.name)] = state

func _init_machine():
	for state in states:
		states[state].controlled_node = controlled_node
		states[state].state_machine = self

	if state_initial:
		current_states = state_initial
		current_states._enter()

func _change_state(new_state):
	if states.has(new_state) and str(current_states.name) != new_state:
		current_states._exit()
		current_states = states[new_state]
		current_states._enter()

func _process(delta: float) -> void:
	if current_states and current_states.has_method("_on_process"):
		current_states._on_process(delta)

func _physics_process(delta: float) -> void:
	if current_states and current_states.has_method("_on_physics_process"):
		current_states._on_physics_process(delta)

func _unhandled_input(event: InputEvent) -> void:
	if current_states and current_states.has_method("_on_unhandled_input"):
		current_states._on_unhandled_input(event)

func _unhandled_key_input(event: InputEvent) -> void:
	if current_states and current_states.has_method("_on_unhandled_key_input"):
		current_states._on_unhandled_key_input(event)
