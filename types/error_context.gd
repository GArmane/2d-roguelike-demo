class_name ErrorContext


var code: Error
var msg: String
var value: Dictionary


func _init(code: Error, msg: String, context: Dictionary) -> void:
	code = code
	msg = msg
	context = context


func _to_string() -> String:
	return "Error(%s): %s" % [code, msg]
