@icon("res://assets/icon-godot-node/node/icon_gear.png")
class_name FiniteStateMachine extends Node


signal state_changed(old, new, data)


# The node which the state machine will directly act upon.
@export var subject: Node
# The initial state of the state machine. If not set, the first child State none is used.
@export var initial_state: State = null
# Initial data to be processed by the state machine
@export var initial_data: Dictionary = {}

# The current state of the state machine. If no initial state found, get
# first child and set it as the initial state. If there is no children,
# the FSM starts with a null state and errors out.
@onready var _current_state: State = (func(): return initial_state if initial_state else get_child(0)).call() :
	set(value):
		if _current_state == value:
			return
		emit_signal("state_changed", _current_state, value)
		_current_state = value


func _ready() -> void:
	# Get all states children of the FSM and connect their signals.
	for state: State in find_children("*", "State"):
		state.finished.connect(_on_state_finished)

	await owner.ready
	_current_state.enter("", initial_data).unwrap()


func _physics_process(delta: float) -> void:
	_current_state.physics_run(delta).unwrap()


func _process(delta: float) -> void:
	_current_state.run(delta).unwrap()


func _unhandled_input(event: InputEvent) -> void:
	_current_state.handle_input(event).unwrap()


# Signal Handlers
func _on_state_finished(target_state_path: String) -> void:
	set_state(target_state_path).unwrap()


# Public API
func set_state(target_state_path: String, data: Dictionary = {}) -> Result:
	var next_state := get_node(target_state_path) as State
	if not next_state:
		return Result.new(ERR_DOES_NOT_EXIST, "state %s does not exist" % target_state_path)

	_current_state.exit().unwrap()
	var _data = next_state.enter(_current_state.name, data).unwrap()
	_current_state = next_state
	return Result.new(OK)
