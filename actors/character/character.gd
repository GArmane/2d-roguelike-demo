@icon("res://assets/icon_godot_node/node_2D/icon_character.png")

class_name Character extends CharacterBody2D

const FRICTION: float = 0.15
@export var accerelation: int = 40
@export var max_speed: int = 100
@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var mov_direction: Vector2 = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * accerelation
	velocity = velocity.limit_length(max_speed)
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)

func set_orientation(vec: Vector2) -> Result:
	if vec.x > 0 and $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = false
	elif vec.x < 0 and not $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = true
	return Result.ok()
