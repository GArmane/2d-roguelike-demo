extends State


func enter(_previous_state_path: String) -> Result:
	owner.animation_player.play("run")
	return Result.ok(self)

func exit() -> Result:
	owner.move_direction = Vector2.ZERO
	return Result.ok(self)

func update(_delta: float) -> Result:
	owner.look_direction = (owner.get_global_mouse_position() - owner.global_position)
	if Input.is_action_pressed("player_attack"):
		owner.attack()
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
		owner.move_direction = direction
	return Result.ok(self)
