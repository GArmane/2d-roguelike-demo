@icon("res://assets/icon-godot-node/node/icon_gear.png")
class_name FiniteStateMachine extends Node


# The initial state of the state machine. If not set, the first child node is used.
@export var initial_state: State = null


# The current state of the state machine. If no initial state found, get
# first child and set it as the initial state. If there is not children,
# the FSM starts with a null state and errors out.
@onready var _current_state: State = (
	func() -> Optional:
		return Optional.some(initial_state) if initial_state \
		else Optional.from_unsafe(func(): return get_child(0))
).call().unwrap()


func _ready() -> void:
	# Get all states children of the FSM and connect their signals.
	for state: State in find_children("*", "State"):
		state.finished.connect(_on_state_finished)

	await owner.ready
	_current_state.enter("").unwrap()


func _unhandled_input(event: InputEvent) -> void:
	_current_state.handle_input(event).unwrap()


func _physics_process(delta: float) -> void:
	_current_state.physics_run(delta).unwrap()


func _process(delta: float) -> void:
	_current_state.update(delta).unwrap()


func _on_state_finished(target_state_path: String) -> void:
	_current_state.exit().unwrap()
	Some.from_unsafe(func(): return get_node(target_state_path)).ok() \
	.map_err(func(__):
		return Result.error(owner.name + ": Trying to transition to state " + target_state_path + " but it does not exist.")
	).map(func(next_state):
		next_state.enter(_current_state.name)
		return next_state
	).map(func(next_state):
		_current_state = next_state
		return Result.ok(_current_state)
	).unwrap()
