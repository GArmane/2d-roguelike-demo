@icon("res://assets/icon_godot_node/node_2D/icon_character.png")
class_name Character extends CharacterBody2D

const FRICTION: float = 0.15
@export var acceleration: int = 40
@export var max_speed: int = 100
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var look_direction: Vector2 = Vector2.ZERO :
	set(value): look_direction = value.normalized()

@onready var move_direction: Vector2 = Vector2.ZERO :
	set(value): move_direction = value.normalized()

func _physics_process(_delta: float) -> void:
	velocity += move_direction * acceleration
	velocity = velocity.limit_length(max_speed)
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	_update_sprite_look_direction()

func _update_sprite_look_direction() -> void:
	if look_direction.x > 0 and $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = false
	elif look_direction.x < 0 and not $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = true
