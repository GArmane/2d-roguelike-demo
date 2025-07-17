extends State


func enter(_previous_state_path: String, data: Dictionary = {}) -> Result:
	owner.animation_player.play("fly")
	owner.proximity_sensor.body_exited.connect(_on_proximity_body_exited)
	return Result.ok(data)


func exit() -> Result:
	owner.proximity_sensor.body_exited.disconnect(_on_proximity_body_exited)
	return Result.ok(self)


func physics_run(_delta: float) -> Result:
	# If there is no target, first it'll try to reach the last known target
	# position before going back to idle.
	if not owner.target and owner.navigation_agent.is_target_reached():
		emit_signal("finished", "Idle")
		return Result.ok(self)

	# If there is a target or it has not reach the last known target position,
	# continue chasing.
	owner.move_direction = owner \
		.to_local(owner.navigation_agent.get_next_path_position()) \
		.normalized()
	return Result.ok(self)


func _on_proximity_body_exited(_body: Node2D) -> void:
	if owner: owner.target = null
