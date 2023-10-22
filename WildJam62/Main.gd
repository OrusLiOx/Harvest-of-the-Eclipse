extends Node

var day = 1
var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

var souls = []

var floors = {
	"Top" : 112,
	"Middle" : 256,
	"Bottom" : 384,
	"Gone" : -128
}

var Positions = {
	"Sunday" : {
		"Mom" : Vector2(0,floors["Gone"]),
		"Dad" : Vector2(0,floors["Gone"]),
		"Steve" : Vector2(0,floors["Gone"]),
		"Emily" : Vector2(0,floors["Gone"]),
		"Marri" : Vector2(0,floors["Gone"]),
		"EndDay" : Vector2(0,floors["Gone"]),
		"Doug" : Vector2(0,floors["Gone"])
	},
	"Monday" : {
		"Mom" : Vector2(56,floors["Middle"]),
		"Dad" : Vector2(0,floors["Gone"]),
		"Steve" : Vector2(920,floors["Top"]),
		"Emily" : Vector2(598,floors["Top"]),
		"Marri" : Vector2(224,floors["Top"]),
		"EndDay" : Vector2(-296,floors["Middle"]),
		"Doug" : Vector2(-320,floors["Middle"])
	},
	"Tuesday" : {
		"Mom" : Vector2(-104,floors["Top"]),
		"Dad" : Vector2(904,floors["Middle"]),
		"Steve" : Vector2(0,floors["Gone"]),
		"Emily" : Vector2(64,floors["Middle"]),
		"Marri" : Vector2(208,floors["Top"]),
		"EndDay" : Vector2(800,floors["Bottom"]),
		"Doug" : Vector2(0,floors["Gone"])
	},
	"Wednesday" : {
		"Mom" : Vector2(40,floors["Middle"]),
		"Dad" : Vector2(0,floors["Gone"]),
		"Steve" : Vector2(0,floors["Gone"]),
		"Emily" : Vector2(408,floors["Bottom"]),
		"Marri" : Vector2(224,floors["Top"]),
		"EndDay" : Vector2(864,floors["Bottom"]),
		"Doug" : Vector2(0,floors["Gone"])
	},
	"Thursday" : {
		"Mom" : Vector2(-128,floors["Top"]),
		"Dad" : Vector2(64,floors["Middle"]),
		"Steve" : Vector2(920,floors["Top"]),
		"Emily" : Vector2(0,floors["Bottom"]),
		"Marri" : Vector2(0,floors["Gone"]), #Use Alternate Marri at piano
		"EndDay" : Vector2(632,floors["Top"]),
		"Doug" : Vector2(0,floors["Gone"])
	},
	"Friday" : {
		"Mom" : Vector2(0,floors["Gone"]),
		"Dad" : Vector2(536,floors["Bottom"]),
		"Steve" : Vector2(912,floors["Middle"]),
		"Emily" : Vector2(0,floors["Gone"]),
		"Marri" : Vector2(0,floors["Gone"]),
		"EndDay" : Vector2(368,floors["Bottom"]),
		"Doug" : Vector2(0,floors["Gone"])
	},
	"Saturday" : {
		"Mom" : Vector2(0,floors["Gone"]),
		"Dad" : Vector2(0,floors["Gone"]),
		"Steve" : Vector2(0,floors["Gone"]),
		"Emily" : Vector2(0,floors["Gone"]),
		"Marri" : Vector2(0,floors["Gone"]),
		"EndDay" : Vector2(0,floors["Gone"]),
		"Doug" : Vector2(0,floors["Gone"])
	}
}

func _ready():
	$DayTransition.hide()
	$Boundaries.hide()
	$SelectionScene.hide()
	$Ending.hide()
	$Title.show()
	$PlayerV2/Bgm.playing = true
	$PlayerV2.interacting = true
	
	
func startDay():
	
	$DayTransition/ColorRect/Label.text = days[day]
	$DayTransition.show()
	$SelectionScene.hide()
	
	$NPCs.MoveNPCs(Positions[days[day]])
	$PlayerV2.position = Vector2(-368, 224)
	
	$Dougs.randomizeDougs()
	
	if $MarriSong.playing == true:
		$MarriSong.playing = false
		$PlayerV2/Bgm.playing = true
	
	if day == 4:
		$MarriPiano.show()
		$PlayerV2/Bgm.playing = false
		$MarriSong.playing = true
	else:
		$MarriPiano.hide()
	
	yield(get_tree().create_timer(3.0), "timeout")
	
	if day >= 6:
		endCutscene()
		return 0
	
	$DayTransition.hide()
	
	$PlayerV2.day = day
	$PlayerV2.interacting = false

func endDay():
	$PlayerV2.interacting = true
	$SelectionScene.show()
	$SelectionScene.onDayEnd(day)

func _on_Title_Start():
	$Title.hide()
	startDay()


func _on_SelectionScene_EndDay(person):
	day += 1
	souls.append(person)
	startDay()

func endCutscene():
	$PlayerV2/Bgm.pitch_scale = .2
	$Ending.EndGame(souls)
	$Ending.show()
	$DayTransition.hide()
