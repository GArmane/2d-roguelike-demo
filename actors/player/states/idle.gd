extends State


func enter(_previous_state_path: String) -> Result:
	owner.move_direction = Vector2.ZERO
	owner.animation_player.play("idle")
	return Result.ok(self)

func update(_delta: float) -> Result:
	owner.look_direction = (owner.get_global_mouse_position() - owner.global_position)
	if Input.is_action_pressed("player_attack"):
		emit_signal("finished", "Attack")
	if Input.is_action_pressed("player_down") \
	or Input.is_action_pressed("player_left") \
	or Input.is_action_pressed("player_right") \
	or Input.is_action_pressed("player_up"):
		emit_signal("finished", "Running")
	return Result.ok(self)
