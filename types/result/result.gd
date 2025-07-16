class_name Result

# Constructors for Result instances.
static func ok(value = null) -> Result:
	return Ok.new(value)


static func error(value) -> Result:
	return Error.new(value)


# Execute an unsafe function (returns null when errored) and wraps it around
# a Result type.
static func from_unsafe(f: Callable) -> Result:
	var res = f.call()
	return Result.ok(res) if res != null else Result.error(res)


# Result type interface.
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


func unwrap_or_default(_default):
	assert(false, "Not Implemented")
	return null


func unwrap_or_else(_f: Callable):
	assert(false, "Not Implemented")
	return null
