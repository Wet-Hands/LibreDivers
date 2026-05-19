@icon("res://assets/node_state.png")
class_name State
extends Component

var state_machine : StateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine = self.get_parent()

func _enter(previous_state : State) -> void:
	pass

func _exit() -> void:
	pass

func _update(delta : float) -> void:
	pass

func _physics_update(delta : float) -> void:
	pass
