extends State


func enter(_previous_state_path: String, _data: Dictionary = {}):
	owner.direction = Vector2.ZERO
	owner.play_animation("idle")

func update(_delta: float) -> void:
	var mouse_direction: Vector2 = (owner.get_global_mouse_position() - owner.global_position) \
		.normalized()
	owner.set_orientation(mouse_direction)
	owner.rotate_weapon(mouse_direction)

	if Input.is_action_pressed("player_attack"):
		owner.attack()
	if Input.is_action_pressed("player_down") \
	or Input.is_action_pressed("player_left") \
	or Input.is_action_pressed("player_right") \
	or Input.is_action_pressed("player_up"):
		emit_signal("finished", "Running")
