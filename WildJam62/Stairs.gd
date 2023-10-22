extends Area2D

export var id : int
export var stairTexture : Texture
var partner = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = stairTexture
	var stairs = get_tree().get_nodes_in_group("Stairs")
	for stair in stairs:
		if stair.id == id:
			if stair != self:
				partner = stair
				break
	if partner == null:
		queue_free()

func interact(var area):
	area.global_position = partner.get_node("MovePoint").global_position
