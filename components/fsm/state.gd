@icon("res://assets/icon-godot-node/node/icon_lever.png")
class_name State extends Node

# Emits when state finishes and transitions to another state.
signal finished(next_state_path: String, data: Dictionary)


# Called by the state machine upon changing the active state. The `data` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_previous_state_path: String, _data: Dictionary = {}):
	pass

# Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
	pass

# Called by the state machine when receiving unhandled input events.
func handle_input(_event: InputEvent):
	pass

# Called by the state machine on the engine's physics update tick.
func physics_run(_delta: float) -> void:
	pass

# Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	pass
