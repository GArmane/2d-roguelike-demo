class_name Hitbox extends Area2D


@export var damage := 1
@export var knockback_force := 300
@onready var knoback_direction := Vector2.ZERO


func _on_body_entered(body: Node2D) -> void:
	body.take_damage(damage, knoback_direction, knockback_force)
