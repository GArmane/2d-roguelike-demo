@icon("res://assets/icon-godot-node/node-2D/icon_character.png")
class_name EyeBat extends Character

@export var target: Node2D = null

func _physics_process(delta: float) -> void:
	direction = to_local($NavigationAgent2D.get_next_path_position()).normalized()
	super(delta)

func _on_navigation_path_timer_timeout() -> void:
	if target:
		$NavigationAgent2D.target_position = target.global_position
