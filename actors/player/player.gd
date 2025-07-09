@icon("res://assets/icon_godot_node/node_2D/icon_human_controller.png")
class_name PlayerCharacter extends Character


func play_animation(anim_name: String) -> Result:
	$AnimationPlayer.play(anim_name)
	return Result.ok()
