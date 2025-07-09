class_name Result

# Constructors for Result instances.
static func ok(value) -> Result:
	return Ok.new(value)


static func error(value) -> Result:
	return Error.new(value)


func is_ok() -> bool:
	assert(false, "Not Implemented")
	return false


func is_error() -> bool:
	assert(false, "Not Implemented")
	return false


func bind(f: Callable) -> Result:
	assert(false, "Not Implemented")
	return null


func fold(on_ok: Callable, on_error: Callable):
	assert(false, "Not Implemented")
	return null


func map(f: Callable) -> Result:
	assert(false, "Not Implemented")
	return null


func unwrap():
	assert(false, "Not Implemented")
	return null


func unwrap_else(default):
	assert(false, "Not Implemented")
	return null


func unwrap_or_else(f: Callable):
	assert(false, "Not Implemented")
	return null
