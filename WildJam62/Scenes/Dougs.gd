extends Node


func randomizeDougs():
	for doug in get_children():
		if (randi() % 5) == 0:
			doug.show()
		else:
			doug.hide()
