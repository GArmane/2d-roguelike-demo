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


func bind(f: Callable) -> Result:
	return f.call(_value)


func fold(on_ok: Callable, _on_error: Callable):
	return on_ok.call(_value)


func map(f: Callable) -> Result:
	return Result.ok(f.call(_value))


func unwrap():
	return _value


func unwrap_or_default(_default):
	return _value


func unwrap_or_else(_f: Callable):
	return _value
