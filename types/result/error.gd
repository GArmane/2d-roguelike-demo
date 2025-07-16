class_name Error extends Result

var _value = null


func _init(value) -> void:
	_value = value


func _to_string():
	return "Error(%s)" % _value


func is_ok() -> bool:
	return false


func is_error() -> bool:
	return !is_ok()


func bind(_f: Callable) -> Result:
	return Result.error(_value)


func fold(_on_ok: Callable, on_error: Callable):
	return on_error.call(_value)


func map(_f: Callable) -> Result:
	return Result.error(_value)


func unwrap():
	assert(false, "Ok(%s)" % _value)
	return null


func unwrap_or_default(default):
	return default


func unwrap_or_else(f: Callable):
	return f.call(_value)
