extends Control

var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

var notes = {
	"Sunday" : {
		"Mom" : "",
		"Dad" : "",
		"Steve" : "",
		"Emily" : "",
		"Marri" : ""
	},
	"Monday" : {
		"Mom" : "Mom is drinking wine in the bath.",
		"Dad" : "",
		"Steve" : "",
		"Emily" : "",
		"Marri" : ""
	},
	"Tuesday" : {
		"Mom" : "",
		"Dad" : "",
		"Steve" : "",
		"Emily" : "",
		"Marri" : ""
	},
	"Wednesday" : {
		"Mom" : "",
		"Dad" : "",
		"Steve" : "",
		"Emily" : "",
		"Marri" : ""
	},
	"Thursday" : {
		"Mom" : "",
		"Dad" : "",
		"Steve" : "",
		"Emily" : "",
		"Marri" : ""
	},
	"Friday" : {
		"Mom" : "",
		"Dad" : "",
		"Steve" : "",
		"Emily" : "",
		"Marri" : ""
	}
}

var known_notes = {
	"Sunday" : {
		"Mom" : false,
		"Dad" : false,
		"Steve" : false,
		"Emily" : false,
		"Marri" : false
	},
	"Monday" : {
		"Mom" : false,
		"Dad" : false,
		"Steve" : false,
		"Emily" : false,
		"Marri" : false
	},
	"Tuesday" : {
		"Mom" : false,
		"Dad" : false,
		"Steve" : false,
		"Emily" : false,
		"Marri" : false
	},
	"Wednesday" : {
		"Mom" : false,
		"Dad" : false,
		"Steve" : false,
		"Emily" : false,
		"Marri" : false
	},
	"Thursday" : {
		"Mom" : false,
		"Dad" : false,
		"Steve" : false,
		"Emily" : false,
		"Marri" : false
	},
	"Friday" : {
		"Mom" : false,
		"Dad" : false,
		"Steve" : false,
		"Emily" : false,
		"Marri" : false
	}
}

func _ready():
	UpdateNotes("Mom", 1)
	UpdateCalendar()

func UpdateNotes(var person, var day):
	known_notes[days[day]][person] = true

func UpdateCalendar():
	for day in days:
		var day_text = ""
		for person in notes[day].keys():
			if known_notes[day][person] == true:
				day_text += "\n" + notes[day][person]
		get_node(day+"Text").text = day_text
