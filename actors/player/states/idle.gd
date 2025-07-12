extends "res://actors/player/states/base.gd"


func enter(_previous_state_path: String, _data: Dictionary = {}):
	player.mov_direction = Vector2.ZERO
	player.play_animation("idle")

func update(_delta: float) -> void:
	var mouse_direction: Vector2 = (player.get_global_mouse_position() - player.global_position) \
		.normalized()
	player.set_orientation(mouse_direction)
	player.rotate_weapon(mouse_direction)

	if Input.is_action_pressed("player_attack"):
		player.attack()
	if Input.is_action_pressed("player_down") \
	or Input.is_action_pressed("player_left") \
	or Input.is_action_pressed("player_right") \
	or Input.is_action_pressed("player_up"):
		emit_signal("finished", RUNNING)
