extends State


func enter(_previous_state_path: String, data: Dictionary = {}) -> Result:
	subject.animation_player.play("run")
	return Result.new(OK, data)


func exit() -> Result:
	subject.move_direction = Vector2.ZERO
	return Result.new(OK)


func run(_delta: float) -> Result:
	subject.look_direction = (subject.get_global_mouse_position() - subject.global_position)
	if Input.is_action_pressed("player_attack"):
		emit_signal("finished", "Attacking")
	var direction = Vector2.ZERO
	if Input.is_action_pressed("player_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("player_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("player_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("player_up"):
		direction += Vector2.UP
	if direction == Vector2.ZERO:
		emit_signal("finished", "Idle")
	else:
		subject.move_direction = direction
	return Result.new(OK)
