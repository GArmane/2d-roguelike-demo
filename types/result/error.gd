class_name Error extends Result

var _value = null


func _init(value) -> void:
	_value = value


func _to_string() -> String:
	return "Error(%s)" % _value


func is_ok() -> bool:
	return false


func is_error() -> bool:
	return !is_ok()


func bind(_f: Callable) -> Error:
	return self


func map(_f: Callable) -> Error:
	return self


func map_err(f: Callable):
	return f.call(_value)


func unwrap():
	assert(false, "Error(%s)" % _value)
	return null


func unwrap_or_default(default):
	return default


func unwrap_or_else(f: Callable):
	return f.call(_value)
