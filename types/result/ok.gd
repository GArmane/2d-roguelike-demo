class_name Ok extends Result

var _value = null


func _init(value) -> void:
	_value = value


func _to_string():
	return "Ok(%s)" % _value


func is_ok() -> bool:
	return true


func is_error() -> bool:
	return !is_ok()


func bind(f: Callable) -> Ok:
	return f.call(_value)


func map(f: Callable) -> Ok:
	return Result.ok(f.call(_value))


func map_err(_f: Callable) -> Ok:
	return self


func unwrap():
	return _value


func unwrap_or_default(_default):
	return _value


func unwrap_or_else(_f: Callable):
	return _value
