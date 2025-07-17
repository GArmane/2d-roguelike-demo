extends Node2D


signal target_hit(body: Node2D)


func _on_area_2d_body_entered(body: Node2D) -> void:
	emit_signal("target_hit", body)
