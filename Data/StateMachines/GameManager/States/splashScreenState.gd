extends State
class_name splash_screen_state


##called once when entering the state and then not again until it has finished
func on_enter():
	state_machine.bb["finish_splash"] = true
	print("splash_screen")
	pass

##called when we exit the state
func on_exit():
	pass

##called every frame for this state
func tick():
	pass
