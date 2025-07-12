@icon("res://assets/icon_godot_node/node_2D/icon_character.png")
class_name Character extends CharacterBody2D

const FRICTION: float = 0.15
@export var acceleration: int = 40
@export var max_speed: int = 100
@onready var direction: Vector2 = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	direction = direction.normalized()
	velocity += direction * acceleration
	velocity = velocity.limit_length(max_speed)
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)

func play_animation(anim_name: String) -> Result:
	$AnimationPlayer.play(anim_name)
	return Result.ok()

func set_orientation(vec: Vector2) -> Result:
	if vec.x > 0 and $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = false
	elif vec.x < 0 and not $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = true
	return Result.ok()
