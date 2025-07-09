extends "res://actors/player/states/base.gd"


func enter(_previous_state_path: String, _data: Dictionary = {}):
	player.mov_direction = Vector2.ZERO
	player.play_animation("idle")

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("player_down") \
	or event.is_action_pressed("player_left") \
	or event.is_action_pressed("player_right") \
	or event.is_action_pressed("player_up"):
		emit_signal("finished", RUNNING)

func run(_delta: float) -> void:
	var mouse_direction: Vector2 = (player.get_global_mouse_position() - player.global_position) \
		.normalized()
	player.set_orientation(mouse_direction)
