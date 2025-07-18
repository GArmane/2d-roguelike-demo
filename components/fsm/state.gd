@icon("res://assets/icon-godot-node/node/icon_lever.png")
class_name State extends Node


# Emits when state finishes and transitions to another state.
signal finished(next_state_path: String)


var subject: Node :
	get(): return get_parent().subject


# Called by the state machine upon changing the active state. The `data` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_previous_state_path: String, data: Dictionary = {}) -> Result:
	return Result.new(OK, data)


# Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> Result:
	return Result.new(OK)


# Called by the state machine when receiving unhandled input events.
func handle_input(_event: InputEvent) -> Result:
	return Result.new(OK)


# Called by the state machine on the engine's physics update tick.
func physics_run(_delta: float) -> Result:
	return Result.new(OK)


# Called by the state machine on the engine's main loop tick.
func run(_delta: float) -> Result:
	return Result.new(OK)
