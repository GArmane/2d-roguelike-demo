@icon("res://assets/icon-godot-node/node-2D/icon_character.png")
class_name EyeBat extends Character

@export var target: Node2D = null
@onready var navigation_agent := $NavigationAgent2D
@onready var navigation_path_timer := $NavigationPathTimer
@onready var proximity_sensor := $Sensors/Proximity


func _on_navigation_path_timer_timeout() -> void:
	if target:
		$NavigationAgent2D.target_position = target.global_position


func _on_combat_agent_hitpoints_depleted(
	_damage: int,
	_value_current: int
) -> void:
	print("TIRA!!!!")
	queue_free()


func _on_combat_agent_attr_changed(
	attr: String,
	value_before: Variant,
	value_current: Variant
) -> void:
	print(attr, value_before, value_current)
