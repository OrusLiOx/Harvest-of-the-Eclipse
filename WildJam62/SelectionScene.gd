extends CanvasLayer

signal EndDay(person)

func onDayEnd(var today : int):
	$Background/SelectionController.reset(today)

func _on_SelectionController_CollectSoul(person):
	emit_signal("EndDay", person)
	
func updateNotes(var person, var day):
	$Background/SelectionController/Calendar.UpdateNotes(person, day)
