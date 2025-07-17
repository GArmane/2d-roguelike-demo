extends Node


# TODO Character IDs persistent between game sessions. Base GUID are not
# persistent.
var _registry: Dictionary = {}


# Register API
func register(agent_owner: Node2D, agent: CombatAgent) -> Result:
	return Result.from_unsafe(func(): return _registry.get_or_add(agent_owner.to_string(), agent))


func unregister(agent_owner: Node2D) -> Result:
	return Result.from_unsafe(func(): return _registry.erase(agent_owner.to_string()))


# Combat flow
func get_agent(agent_owner: Node2D) -> Optional:
	return Optional.from_unsafe(func(): return _registry.get(agent_owner.to_string()))


func register_attack(source: Node2D, target: Node2D) -> Result:
	var source_agent = get_agent(source)
	var target_agent = get_agent(source)

	if source_agent.is_none():
		return Result.error("Source agent not registered")
	if target_agent.is_none():
		return Result.error("Target agent not registered")

	var attack_damage = source_agent.unwrap().attack_damage
	return target_agent.ok() \
		.bind(func(agent): return agent.apply_damage(attack_damage))
