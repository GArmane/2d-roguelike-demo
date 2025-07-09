@icon("res://assets/icon_godot_node/node/icon_gear.png")

class_name FSM extends Node

# The initial state of the state machine. If not set, the first child node is used.
@export var initial_state: State = null

# The current state of the state machine. If no initial state found, get
# first child and set it as the initial state. If there is not children,
# the FSM starts with a null state and errors out.
@onready var state: State = (func get_initial_state() -> State:
	return initial_state if initial_state != null else get_child(0)
).call()

var _states: Array[State] = []


func _ready() -> void:
	# Get all states children of the FSM and connect their signals.
	_states = find_children("*", "State") as Array[State]
	for state_node: State in _states:
		state.finished.connect(_transition_to_next_state)

	await owner.ready
	state.enter("")


func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)


func _physics_process(delta: float) -> void:
	state.physics_run(delta)


func _process(delta: float) -> void:
	state.run(delta)


func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> Result:
	if not has_node(target_state_path):
		var msg = owner.name + ": Trying to transition to state " + target_state_path + " but it does not exist."
		assert(false, msg)
		return Result.error(msg)

	state.exit()
	state = get_node(target_state_path)
	state.enter(state.name, data)

	return Result.ok(state)
