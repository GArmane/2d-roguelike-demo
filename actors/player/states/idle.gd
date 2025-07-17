extends State


func enter(_previous_state_path: String) -> Result:
	self.subject.move_direction = Vector2.ZERO
	self.subject.animation_player.play("idle")
	return Result.new(OK)


func run(delta: float) -> Result:
	subject.look_direction = (subject.get_global_mouse_position() - subject.global_position)
	if Input.is_action_pressed("player_attack"):
		emit_signal("finished", "Attacking")
	if Input.is_action_pressed("player_down") \
	or Input.is_action_pressed("player_left") \
	or Input.is_action_pressed("player_right") \
	or Input.is_action_pressed("player_up"):
		emit_signal("finished", "Running")
	return Result.new(OK)
