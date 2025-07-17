class_name Result


var _status: Error
var _value: Variant


func _init(status: Error, value: Variant = null):
	_status = status
	_value = value


func is_ok() -> bool:
	return _status == OK


func is_error() -> bool:
	return !is_ok()


func unwrap() -> Variant:
	if is_error():
		assert(false, "%s" % _value)
	return _value


func unwrap_or_else(f: Callable) -> Variant:
	if is_error():
		return f.call()
	return _value
