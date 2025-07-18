class_name Hitbox extends Area2D

@export var damage: int = 1
@export var knockback_force: int = 300
var knockback_direction: Vector2 = Vector2.ZERO


func _on_body_entered(body: Node2D) -> void:
	body.apply_damage(damage, knockback_direction, knockback_force).unwrap()
