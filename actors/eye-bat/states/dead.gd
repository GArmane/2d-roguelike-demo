extends State


func enter(previous_state_path: String, data: Dictionary = {}) -> Result:
	return Result.new(OK, data)


func exit() -> Result:
	return Result.new(OK)


func run(_delta: float) -> Result:
	if not subject.is_queued_for_deletion():
		subject.queue_free()
	return Result.new(OK)
