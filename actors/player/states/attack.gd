extends State


var _previous_state_path: String


func enter(previous_state_path: String) -> Result:
	owner.attack().unwrap()
	_previous_state_path = previous_state_path
	return Result.ok(self)


func update(_delta: float) -> Result:
	emit_signal("finished", _previous_state_path)
	return Result.ok()
