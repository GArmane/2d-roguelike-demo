extends State


func _on_proximity_body_entered(body: Node2D) -> void:
	subject.target = body
	emit_signal("finished", "Chasing")


func enter(_previous_state_path: String, data: Dictionary = {}) -> Result:
	subject.animation_player.play("fly")
	subject.move_direction = Vector2.ZERO
	subject.proximity_sensor.body_entered.connect(_on_proximity_body_entered)
	return Result.new(OK, data)


func exit() -> Result:
	subject.proximity_sensor.body_entered.disconnect(_on_proximity_body_entered)
	return Result.new(OK)
