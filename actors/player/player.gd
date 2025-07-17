@icon("res://assets/icon-godot-node/node-2D/icon_human_controller.png")
class_name PlayerCharacter extends Character


func _physics_process(delta: float) -> void:
	super(delta)
	_update_weapon_direction()


func _update_weapon_direction() -> void:
	$Sword.rotation = look_direction.angle()
	$Sword.scale.y = -1 if $Sword.scale.y == 1 and look_direction.x < 0 \
					else 1 if $Sword.scale.y == -1 and look_direction.x > 0 \
					else $Sword.scale.y


func attack() -> Result:
	$Sword/AnimationPlayer.play("attack")
	return Result.ok()


func _on_sword_target_hit(body: Node2D) -> void:
	$CombatAgent.attack_target(body).unwrap()
