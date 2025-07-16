class_name None extends Optional


func _to_string():
	return "None()"


# Optional type interface.
func is_some() -> bool:
	return false


func is_none() -> bool:
	return !is_some()


func bind(_f: Callable) -> Optional:
	return self


func map(_f: Callable) -> Optional:
	return self


func ok() -> Error:
	return Result.error(null)


func ok_or(default: Result) -> Result:
	return default


func ok_or_else(f: Callable) -> Result:
	return f.call()


func unwrap():
	assert(false, "None()")
	return null


func unwrap_or_default(default):
	return default


func unwrap_or_else(f: Callable):
	return f.call()
