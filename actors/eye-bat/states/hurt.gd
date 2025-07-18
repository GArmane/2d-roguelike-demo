extends State


var _previous_state_path: String
var _data: Dictionary


func enter(previous_state_path: String, data: Dictionary = {}) -> Result:
	_previous_state_path = previous_state_path
	_data = data
	return Result.new(OK, data)


func exit() -> Result:
	_previous_state_path = ""
	_data = {}
	return Result.new(OK)


func run(_delta: float) -> Result:
	subject.hitpoints -= abs(_data.damage)
	if subject.hitpoints <= 0:
		emit_signal("finished", "Dead")
	else:
# 		TODO Apply knockback force
#		var damage_data = {
#			"damage": damage,
#			"knockback_direction": knockback_direction,
#			"knockback_force": knockback_force
#		}
		emit_signal("finished", _previous_state_path)
	return Result.new(OK)
