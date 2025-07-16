class_name Optional

# Constructors for Optional instances.
static func some(value) -> Optional:
	return Some.new(value) if value != null else None.new()


static func none() -> Optional:
	return None.new()


# Execute an unsafe function (returns null when errored) and wraps it around
# a Optional type.
static func from_unsafe(f: Callable) -> Optional:
	var res = f.call()
	return Some.new(res) if res != null else None.new()


# Optional type interface.
func is_some() -> bool:
	assert(false, "Not Implemented")
	return false


func is_none() -> bool:
	assert(false, "Not Implemented")
	return false


func bind(_f: Callable) -> Optional:
	assert(false, "Not Implemented")
	return null


func map(_f: Callable) -> Optional:
	assert(false, "Not Implemented")
	return null


func ok() -> Result:
	assert(false, "Not Implemented")
	return null


func ok_or(_default: Result) -> Result:
	assert(false, "Not Implemented")
	return null


func ok_or_else(_f: Callable) -> Result:
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
