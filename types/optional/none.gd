class_name None extends Optional


func _to_string():
	return "None()"


# Optional type interface.
func is_some() -> bool:
	return false


func is_none() -> bool:
	return !is_some()


func bind(f: Callable) -> Optional:
	return self


func fold(_on_some: Callable, on_none: Callable):
	return on_none.call()


func map(f: Callable) -> Optional:
	return self


func unwrap():
	assert(false, "None()")
	return null


func unwrap_or_default(default):
	return default


func unwrap_or_else(f: Callable):
	return f.call()
