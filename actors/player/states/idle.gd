extends State


func enter(_previous_state_path: String, _data: Dictionary = {}):
	owner.move_direction = Vector2.ZERO
	owner.animation_player.play("idle")

func update(_delta: float) -> void:
	owner.look_direction = (owner.get_global_mouse_position() - owner.global_position)
	if Input.is_action_pressed("player_attack"):
		owner.attack()
	if Input.is_action_pressed("player_down") \
	or Input.is_action_pressed("player_left") \
	or Input.is_action_pressed("player_right") \
	or Input.is_action_pressed("player_up"):
		emit_signal("finished", "Running")
