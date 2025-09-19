extends CharacterBody3D

var bb : blackboard = blackboard.new()

func _physics_process(delta: float) -> void:
	pass
<<<<<<< HEAD

#used to set a reference to the state machine within each state
#needed if states are initialized in the inspector instead of code
func _setup_states():
	for s in fsm.states:
		fsm.states[s].state_machine = fsm
=======
>>>>>>> parent of 2667162 ([6] Implement player state machine and movement/look components)
