extends Node

func _ready():
	for npc in get_children():
		if npc.is_in_group("NPC"):
			npc.connect("TalkedTo", get_parent().get_node("SelectionScene"), "updateNotes")
			npc.connect("TalkedTo", $EndDay, "Trigger")

func MoveNPCs(var positions : Dictionary):
	for name in positions.keys():
		var npc = get_node_or_null(name)
		if npc != null:
			npc.position = positions[name]
		if npc.name == "EndDay":
			npc.monitorable = false
			npc.hide()
