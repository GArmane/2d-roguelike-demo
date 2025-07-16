class_name Some extends Optional

var _value


func _init(value):
	_value = value


func _to_string():
	return "Some(%s)" % _value


# Optional type interface.
func is_some() -> bool:
	return true


func is_none() -> bool:
	return !is_some()


func bind(f: Callable) -> Optional:
	return f.call(_value)


func map(f: Callable) -> Optional:
	return Some.new(f.call(_value))


func ok() -> Result:
	return Result.ok(_value)


func ok_or(_default: Result) -> Result:
	return Result.ok(_value)


func ok_or_else(_f: Callable) -> Result:
	return Result.ok(_value)


func unwrap():
	return _value


func unwrap_or_default(_default):
	return _value


func unwrap_or_else(_f: Callable):
	return _value
