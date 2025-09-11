extends Node

var data : blackboard = blackboard.new()
var fsm : StateMachine

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#loadin and initialize all data
	data.load_from_json("res://config.json")
	fsm = StateMachine.new()
	
	#turn on processing for this node
	set_process(true)
	
	#add transitions to the state machine
	addStates()
	fsm.initialize("Preload")
	addTransitions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fsm.process()

##add the states to our machine
func addStates():
	fsm.states["Preload"] = GamePreloadState.new(fsm)
	fsm.states["Splash"] = splash_screen_state.new(fsm)
	fsm.states["Title"] = title_screen_state.new(fsm)

##called to add the transitions needed for the state machine
func addTransitions():
	#transition for moving from loading to splash screens
	fsm.transitions.append(Transition.new(
		func(machine : StateMachine):
			print("checking transition " , ( machine.bb["finished_loading"] == true))
			return machine.bb["finished_loading"] == true,
			fsm, fsm.states["Splash"], fsm.states["Preload"],false,1))
	
	#title screen from splash screens
	fsm.transitions.append(Transition.new(
		func(machine : StateMachine):
			print("checking title transition")
			return machine.bb.has("finish_splash") and machine.bb["finish_splash"] == true,
			fsm, fsm.states["Title"], fsm.states["Splash"],false,1))
