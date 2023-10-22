extends Control

export var group :  ButtonGroup
var confirm :  Button
var selectedRoom : String
var selectedPerson : String
var confirmedOn = false 

var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
var day = 0

var souls = []

var people_in_rooms = {
	"Sunday" : {
		null : null
	},
	"Monday" : {
		"Marri Room" : "Marri",
		"Master Bedroom" : "Mom"
	}, 
	"Tuesday" : {
		"Master Bath" : "Mom",
		"Master Bedroom" : "Dad",
		"Emily Room" : "Emily"
	}, 
	"Wednesday" : {
		"Master Bedroom" : "Mom",
		"Living Room" : "Dad",
		"Steve Room" : "Steve"
	}, 
	"Thursday" : {
		"Music Room" : "Marri",
		"Emily Room" : "Emily"
	}, 
	"Friday" : {
		"Emily Room" : "Emily"
	},
	"Saturday" : {
		null : null
	}
}

signal CollectSoul(selectedPerson)

func _ready():
	confirm = $CollectSoul
	confirm.set_deferred("disabled", true)
	for button in group.get_buttons():
		button.get_node("Label").text = button.name
		button.connect("pressed", self, "button_pressed")
	reset(0)
		
func reset(var today : int):
	day = today
	$DayLabel.text = days[day] + " Night"
	$Calendar.UpdateCalendar()
	
	$RoomSelectedLabel.add_color_override("font_color", "000000")
	$RoomSelectedLabel.text = "PICK A ROOM"
	
	confirmedOn = false
	confirm.set_deferred("disabled", true)
	confirm.show()
	
	$Calendar.hide()
	$CalendarButton.set_deferred("disabled", false)
	$CalendarButton.show()
	
	for button in group.get_buttons():
		button.set_deferred("disabled", false)

func button_pressed():
	if !confirmedOn:
		confirm.disabled = false
		confirmedOn = true
	selectedRoom = group.get_pressed_button().name
	$RoomSelectedLabel.text = selectedRoom

func _on_CollectSoul_pressed():
	$Calendar.hide()
	$CalendarButton.hide()
	confirm.hide()
	$CalendarButton.set_deferred("disabled", true)
	confirm.set_deferred("disabled", true)
	
	for button in group.get_buttons():
		button.set_deferred("disabled", true)
	
	var sel = false
	
	if selectedRoom in people_in_rooms[days[day]]:
		selectedPerson = people_in_rooms[days[day]][selectedRoom]
		if selectedPerson in souls:
			sel = true
			$FailedMark.play()
		else:
			souls.append(selectedPerson)
			$Marked.play()
	else:
		selectedPerson = "No One"
		$FailedMark.play()
	
	$RoomSelectedLabel.add_color_override("font_color", "f11313")
	if sel: 
		$RoomSelectedLabel.text = "You Marked " + selectedPerson + ", Again"
	else:
		$RoomSelectedLabel.text = "You Marked " + selectedPerson

	$WaitTime.start()

func _on_Calendar_toggled(button_pressed):
	if button_pressed:
		confirm.disabled = true
		$Calendar.show()
	else:
		$Calendar.hide()
		if confirmedOn:
			confirm.disabled = false

func _on_WaitTime_timeout():
	emit_signal("CollectSoul", selectedPerson)
