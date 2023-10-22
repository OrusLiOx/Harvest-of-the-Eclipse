extends CanvasLayer

var toCollect = []

func _ready():
	$Cutscene.animation = "Start"
	$Cutscene.playing = true
	$Left.disabled = false
	$Left.show()
	$Right.disabled = true
	$Right.hide()
	$ColorRect/ReportCard.hide()

func EndGame(var marked : Array):
	print(marked)
	for soul in marked:
		if soul != "No One":
			if !(soul in toCollect):
				toCollect.append(soul)
	
	print(toCollect)
	
	if len(toCollect) == 5: 
		$Right.disabled = false
		$Right.show()

func _on_Right_pressed():
	reportcard("Right")
func _on_Left_pressed():
	reportcard("Left")
	
func reportcard(var choice):
	$Left.disabled = true
	$Left.hide()
	$Right.disabled = true
	$Right.hide()
	$Slash.playing = true
	if choice == "Right":
		$Cutscene.animation = "AttackRight"
	else:
		$Cutscene.animation = "AttackLeft"
	
	yield(get_tree().create_timer(3.0), "timeout")
	
	$Cutscene.hide()
	$ColorRect/ReportCard.show()
	
	if choice == "Right":
		$ColorRect/ReportCard.text = "You Are Fired"
	else:
		if len(toCollect) == 5:
			$ColorRect/ReportCard.text = str(len(toCollect)) + "/5 killed\nYou killed a whole family. Good job and welcome to the team."
		elif len(toCollect) == 4:
			$ColorRect/ReportCard.text = str(len(toCollect)) + "/5 killed\nThat’s a \"B\". If you want to be \"A\" reaper you need to be getting A’s on your assignments."
		elif len(toCollect) == 3:
			$ColorRect/ReportCard.text = str(len(toCollect)) + "/5 killed\nI know it’s your first assignment but that’s not good enough for us."
		elif len(toCollect) == 2:
			$ColorRect/ReportCard.text = str(len(toCollect)) + "/5 killed\nDid you even watch our 300 hour training video?"
		elif len(toCollect) == 1:
			$ColorRect/ReportCard.text = str(len(toCollect)) + "/5 killed\nHow did you get hired? It doesn’t matter, you’re not anymore."
		elif len(toCollect) == 0:
			$ColorRect/ReportCard.text = str(len(toCollect)) + "/5 killed\nWhat the hell were you doing this whole time? Actually don’t answer that cause I don’t want to see you again."
	
	yield(get_tree().create_timer(5.0), "timeout")
	
	$ColorRect/ReportCard.text = "The End"
