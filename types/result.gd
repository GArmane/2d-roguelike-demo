class_name Result

# Constructors for Result instances.
static func ok(value = null) -> Result:
	return Ok.new(value)


static func error(value) -> Result:
	return Error.new(value)


func is_ok() -> bool:
	assert(false, "Not Implemented")
	return false


func is_error() -> bool:
	assert(false, "Not Implemented")
	return false


func bind(_f: Callable) -> Result:
	assert(false, "Not Implemented")
	return null


func fold(_on_ok: Callable, _on_error: Callable):
	assert(false, "Not Implemented")
	return null


func map(_f: Callable) -> Result:
	assert(false, "Not Implemented")
	return null


func unwrap():
	assert(false, "Not Implemented")
	return null


func unwrap_else(_default):
	assert(false, "Not Implemented")
	return null


func unwrap_or_else(_f: Callable):
	assert(false, "Not Implemented")
	return null
