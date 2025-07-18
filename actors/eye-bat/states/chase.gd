extends State


func enter(_previous_state_path: String, data: Dictionary = {}) -> Result:
	subject.animation_player.play("fly")
	subject.proximity_sensor.body_exited.connect(_on_proximity_body_exited)
	return Result.new(OK, data)


func exit() -> Result:
	subject.proximity_sensor.body_exited.disconnect(_on_proximity_body_exited)
	return Result.new(OK)


func physics_run(_delta: float) -> Result:
	# If there is no target, first it'll try to reach the last known target
	# position before going back to idle.
	if not subject.target and subject.navigation_agent.is_target_reached():
		emit_signal("finished", "Idle")
		return Result.new(OK)

	# If there is a target or it has not reach the last known target position,
	# continue chasing.
	subject.move_direction = subject \
		.to_local(subject.navigation_agent.get_next_path_position()) \
		.normalized()
	return Result.new(OK)


func _on_proximity_body_exited(_body: Node2D) -> void:
	if subject: subject.target = null
