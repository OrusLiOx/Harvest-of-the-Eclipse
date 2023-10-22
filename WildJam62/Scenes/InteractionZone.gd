extends Area2D

var triggers = ["None", "Mom", "Mom", "Mom", "Emily", "Dad", "None"]

func Trigger(var person, var day):
	if person == triggers[day]:
		monitorable = true
		show()
