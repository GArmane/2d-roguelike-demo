@icon("res://assets/icon_godot_node/node/icon_gear.png")
class_name FiniteStateMachine extends Node

# Initial data set at the start of the FSM process.
@export var initial_data: Dictionary = {}
# The initial state of the state machine. If not set, the first child node is used.
@export var initial_state: State = null

# The current state of the state machine. If no initial state found, get
# first child and set it as the initial state. If there is not children,
# the FSM starts with a null state and errors out.
@onready var _current_state: State = (func get_initial_state() -> State:
	return initial_state if initial_state != null else get_child(0)
).call()

var _states: Array[Node] = []


func _ready() -> void:
	# Get all states children of the FSM and connect their signals.
	_states = find_children("*", "State")
	for state: State in _states:
		state.finished.connect(_transition_to_next_state)

	await owner.ready
	_current_state.enter("", initial_data)

func _unhandled_input(event: InputEvent) -> void:
	_current_state.handle_input(event)

func _physics_process(delta: float) -> void:
	_current_state.physics_run(delta)

func _process(delta: float) -> void:
	_current_state.update(delta)

func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> Result:
	if not has_node(target_state_path):
		var msg = owner.name + ": Trying to transition to state " + target_state_path + " but it does not exist."
		assert(false, msg)
		return Result.error(msg)

	_current_state.exit()
	_current_state = get_node(target_state_path)
	_current_state.enter(_current_state.name, data)

	return Result.ok(_current_state)
