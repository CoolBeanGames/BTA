##this class defines a transition from one state to another
##esentially if its condition (a callable) returns true
##the transition succeeds ad we transition
##otherwsie it fails and we dont transition
extends Resource
class_name Transition

##the condition required for this transition
var condition : Callable
##the state we transition to if it returns true
@export var to_state : State
##the state we need to be in for this transition to be valid
@export var from_state : State
##if this is true then from state is ignored
@export var is_global : bool = false
##how important is this transition
@export var priority : int = 0
##the state machine that is using the transition
@export var state_machine : StateMachine

##setup the transition and assign a condition
func _init(_condition : Callable, _state_machine : StateMachine, _to_state : State,_from_state : State, _is_global : bool = false, _priority : int = 0) -> void:
	condition = _condition
	to_state = _to_state
	priority = _priority
	from_state = _from_state
	is_global = _is_global
	state_machine = _state_machine

##evaluate this transition
func eval(current_state : State) -> bool:
	if condition == null or not condition.is_valid():
		push_warning("A transition failed as its condition is null or invalid")
		return false
	if condition.get_argument_count() != 1:
		push_warning("A Transition failed because it has more or less than 1 argument (which must be a State Machine)")
		return false
	if is_global or from_state == current_state:
		var result = condition.call(state_machine)
		if result is bool:
			return result
		push_warning("A transitions condition returned a non-boolean value, so it failed")
	return false
