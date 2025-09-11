extends State
class_name GamePreloadState

##called once when entering the state and then not again until it has finished
func on_enter():
	state_machine.bb["finished_loading"] = true
	print("preload")
	pass

##called when we exit the state
func on_exit():
	pass

##called every frame for this state
func tick():
	pass
