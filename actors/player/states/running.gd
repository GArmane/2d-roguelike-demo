extends "res://actors/player/states/base.gd"


func enter(_previous_state_path: String, _data: Dictionary = {}) -> void:
	player.play_animation("run")

func exit() -> void:
	player.mov_direction = Vector2.ZERO

func update(_delta: float) -> void:
	var mouse_direction: Vector2 = (player.get_global_mouse_position() - player.global_position) \
		.normalized()
	player.set_orientation(mouse_direction)
	player.rotate_weapon(mouse_direction)

	
	if Input.is_action_pressed("player_attack"):
		player.attack()
	var mov_direction = Vector2.ZERO
	if Input.is_action_pressed("player_down"):
		mov_direction += Vector2.DOWN
	if Input.is_action_pressed("player_left"):
		mov_direction += Vector2.LEFT
	if Input.is_action_pressed("player_right"):
		mov_direction += Vector2.RIGHT
	if Input.is_action_pressed("player_up"):
		mov_direction += Vector2.UP
	if mov_direction == Vector2.ZERO:
		emit_signal("finished", IDLE)
	else:
		player.mov_direction = mov_direction
