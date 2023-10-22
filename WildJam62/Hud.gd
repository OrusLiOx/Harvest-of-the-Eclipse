extends CanvasLayer


var tasks = ["Talk To Mom", "Talk To Steve"]


# Called when the node enters the scene tree for the first time.
func _ready():
	update_todo()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func update_todo():
	var updated_text= "TODO"
	for item in tasks:
		updated_text += "\n- " + item
	$TodoList.text = updated_text
	
