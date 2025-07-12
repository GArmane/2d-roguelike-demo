@icon("res://assets/icon-godot-node/node-2D/icon_human_controller.png")
class_name PlayerCharacter extends Character


func attack() -> Result:
	$Sword/AnimationPlayer.play("attack")
	return Result.ok()

func rotate_weapon(mouse_dir: Vector2) -> Result:
	$Sword.rotation = mouse_dir.angle()
	if $Sword.scale.y == 1 and mouse_dir.x < 0:
		$Sword.scale.y = -1
	elif $Sword.scale.y == -1 and mouse_dir.x > 0:
		$Sword.scale.y = 1
	else:
		pass
	return Result.ok()
