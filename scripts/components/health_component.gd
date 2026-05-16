class_name HealthComponent
extends BaseComponent

@export var maximum_health : float
@export var current_health : float

# TODO Pass the Amount Health Changed through signal
signal current_health_changed
signal maximum_health_changed

signal died

func get_maximum_health() -> float:
	return maximum_health

func set_maximum_health(new_health : float) -> void:
	maximum_health = new_health
	maximum_health_changed.emit()

func get_current_health() -> float:
	return current_health

func set_current_health(new_health : float) -> void:
	current_health = new_health
	current_health_changed.emit()
