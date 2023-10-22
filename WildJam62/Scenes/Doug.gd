extends Area2D

var interacting = false
var textField
var player

signal TalkedTo(person, day)

# Called when the node enters the scene tree for the first time.
func _ready():
	textField = $TextBox/ColorRect/Text
	$Exclaim.show()

func _process(delta):
	if interacting:
		if textField.percent_visible < 1.0:
			textField.percent_visible += 3 * delta
		elif Input.is_action_just_pressed("Interact"):
			interacting = false
			player.interacting = false
			$TextBox.hide()

func interact(var area):
	area.interacting = true
	interacting = true
	player = area
	
	$Exclaim.hide()
	
	emit_signal("TalkedTo", name, area.day)
