@icon("res://assets/icon-godot-node/node/icon_lever.png")
class_name State extends Node


# Emits when state finishes and transitions to another state.
signal finished(next_state_path: String)


# Called by the state machine upon changing the active state. The `data` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_previous_state_path: String) -> Result:
	return Result.ok(self)


# Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> Result:
	return Result.ok(self)


# Called by the state machine when receiving unhandled input events.
func handle_input(event: InputEvent) -> Result:
	return Result.ok(event)


# Called by the state machine on the engine's physics update tick.
func physics_run(_delta: float) -> Result:
	return Result.ok(self)


# Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> Result:
	return Result.ok(self)
