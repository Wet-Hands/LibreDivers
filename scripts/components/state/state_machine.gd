@icon("res://assets/node_state.png")
class_name StateMachine
extends BaseComponent

@export var CURRENT_STATE : State
var states : Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transition.connect(on_child_transition)
		else:
			push_warning("State Machine Contains Incompatible Child Node: ", child)
	
	if CURRENT_STATE == null:
		CURRENT_STATE = self.get_child(0)
	CURRENT_STATE._enter(CURRENT_STATE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	CURRENT_STATE._update(delta)

func _physics_process(delta: float) -> void:
	CURRENT_STATE._physics_update(delta)

func on_child_transition(new_state_name : StringName) -> void:
	var new_state = states.get(new_state_name)
	if new_state != null:
		if new_state != CURRENT_STATE:
			CURRENT_STATE._exit()
			new_state._enter(CURRENT_STATE)
			CURRENT_STATE = new_state
	else:
		push_warning("State Does Not Exist: ", new_state_name)
