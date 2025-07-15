extends State

func _on_proximity_body_exited(_body: Node2D) -> void:
	emit_signal("finished", "Idle")
	owner.target = null

func enter(_previous_state_path: String, _data: Dictionary = {}):
	owner.animation_player.play("fly")
	owner.proximity_sensor.body_exited.connect(_on_proximity_body_exited)

func exit():
	owner.proximity_sensor.body_exited.disconnect(_on_proximity_body_exited)
