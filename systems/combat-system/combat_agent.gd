@icon("res://assets/icon-godot-node/node/icon_sword.png")
class_name CombatAgent extends Node


signal hitpoints_depleted(damage, value_before, value_current)
signal attr_changed(attr, value_before, value_current)


@export var attack_damage := 0 :
	set(value):
		emit_signal("attr_changed", "attack_damage", attack_damage, value)
		attack_damage = value
@export var hitpoints := 0 :
	set(value):
		emit_signal("attr_changed", "hitpoints", hitpoints, value)
		hitpoints = value


func _ready() -> void:
	CombatSystem.register(owner, self).unwrap()


func apply_damage(qtd: int) -> Result:
	hitpoints -= abs(qtd)
	if hitpoints <= 0:
		emit_signal("hitpoints_depleted")
	return Result.ok(hitpoints)


func attack_target(target: Node2D) -> Result:
	return CombatSystem.register_attack(owner, target)
