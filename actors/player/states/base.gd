extends State


const IDLE = "Idle"
const RUNNING = "Running"

var player: PlayerCharacter


func _ready() -> void:
	await owner.ready
	player = owner as PlayerCharacter
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
