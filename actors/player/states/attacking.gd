extends State


var _previous_state_path: String


func enter(previous_state_path: String, data: Dictionary = {}) -> Result:
	if subject.attack().is_error():
		return Result.new(ERR_BUG, "Error while attacking")
	_previous_state_path = previous_state_path
	return Result.new(OK, data)


func run(_delta: float) -> Result:
	emit_signal("finished", _previous_state_path)
	return Result.new(OK)
