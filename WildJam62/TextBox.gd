extends CanvasLayer

var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

var dialogue = {
	"Sunday" : {
		"Mom" : "",
		"Dad" : "",
		"Steve" : "",
		"Emily" : "",
		"Marri" : "",
		"Doug" : ""
	},
	"Monday" : {
		"Mom" : "Can you take Emily and Steve to their sleepovers tonight? (go to the entrance to end the day)",
		"Dad" : "",
		"Steve" : "Dad is coming home tomorrow but I’ll be busy with practice that day so I won’t be able to see him until my game on Wednesday.",
		"Emily" : "Do you think Marri will be okay without me tonight? She’s not afraid of the dark like me so I think she’ll be okay.",
		"Marri" : "Emily is having a sleepover so I can actually have my room to myself for once.",
		"Doug" : "Nice form new reaper, I will be observing you on your first assignment. You have until the eclipse to mark all of your targets. Remember only one target per night and they MUST be alone."
	},
	"Tuesday" : {
		"Mom" : "Can you set up the bath for me tonight? (go to the master bathroom to end the day)",
		"Dad" : "I was hoping to see Steve before his game tomorrow afternoon but he's staying with his friends tonight.",
		"Steve" : "",
		"Emily" : "I can’t believe Marri is abandoning me. I might as well stay in my own room then.",
		"Marri" : "Emily better not mess with my stuff while I’m gone, last time my sheet music was completely out of order.",
		"Doug" : ""
	},
	"Wednesday" : {
		"Mom" : "Can you leave some wine in the living room for John tonight? (go to the wine cellar to end the day)",
		"Dad" : "",
		"Steve" : "",
		"Emily" : "Our new dog is so fluffy, he doesn't seem to like being pet though.",
		"Marri" : "I should probably be practicing for my recital on Friday.",
		"Doug" : ""
	},
	"Thursday" : {
		"Mom" : "Marri always gets so stressed the day before her recitals. I hope she doesn’t stay up too late like she usually does.",
		"Dad" : "Steve is going to his friend's house for a party tonight. Do you think he'll be back before morning? Probably not.",
		"Steve" : "I have been trying to teach the new dog fetch but he wont bring any of his toys back. I wonder where they keep going.",
		"Emily" : "Marri is going to be up all night and I don't want to bother her, can you read me a bedtime story so I can fall asleep? (go to Emily’s room to end the day)",
		"Marri" : "... (She seems extremely focused, I shouldn't bother her)",
		"Doug" : ""
	},
	"Friday" : {
		"Mom" : "",
		"Dad" : "Can you help set up game night? I want everything ready before Marri gets home. (go to the game room to end the day)",
		"Steve" : "Do you think Emily is going to fall asleep early again? If she does you’ll have to carry her up to her room.",
		"Emily" : "",
		"Marri" : "",
		"Doug" : ""
	}
}

func _ready():
	hide()

func _on_NPC_TalkedTo(person, day):
	show()
	$ColorRect/Text.percent_visible = 0
	$ColorRect/Text.text = dialogue[days[day]][person]


func _on_Doug_TalkedTo(person, day):
	show()
	$ColorRect/Text.percent_visible = 0
	$ColorRect/Text.text = dialogue[days[day]][person]
