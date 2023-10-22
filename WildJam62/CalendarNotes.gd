extends ColorRect


var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

var notes = {
	"Sunday" : {
		"Mom" : null,
		"Dad" : null,
		"Steve" : null,
		"Emily" : null,
		"Marri" : null
	},
	"Monday" : {
		"Mom" : "Emily and Steve are at sleepovers.",
		"Dad" : null,
		"Steve" : "Dad won’t be home until tomorrow.",
		"Emily" : null,
		"Marri" : "Marri and Emily usually stay in the same room."
	},
	"Tuesday" : {
		"Mom" : "Mom will be having wine in the bathroom tonight.",
		"Dad" : null,
		"Steve" : null,
		"Emily" : "Emily is staying in her own room tonight.",
		"Marri" : "Marri won’t be home tonight."
	},
	"Wednesday" : {
		"Mom" : "Dad will be having wine in the living room tonight.",
		"Dad" : null,
		"Steve" : null,
		"Emily" : null,
		"Marri" : null
	},
	"Thursday" : {
		"Mom" : "Marri will be up late practicing piano.",
		"Dad" : null,
		"Steve" : null,
		"Emily" : "Emily went to sleep in her own room.",
		"Marri" : null
	},
	"Friday" : {
		"Mom" : null,
		"Dad" : "The family is having game night.",
		"Steve" : "Emily usually falls asleep early and gets carried to her room.",
		"Emily" : null,
		"Marri" : null
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
	UpdateCalendar()

func UpdateNotes(var person, var day):
	known_notes[days[day]][person] = true

func UpdateCalendar():
	for day in days:
		var day_text = ""
		for person in notes[day].keys():
			if known_notes[day][person] == true:
				if notes[day][person] != null:
					day_text += "\n- " + notes[day][person]
		$DayNotes.get_node(day+"Text").text = day_text
