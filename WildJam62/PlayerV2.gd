extends KinematicBody2D

export var speed = 100
var interacting = false
var walking = false
var day = 0

var interactionBox : Area2D

signal FinishedDay

# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.make_current()
	$AnimatedSprite.playing = true
	interactionBox = $Interaction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var movement = Vector2.ZERO
	
	if !interacting:
		if Input.is_action_pressed("Left"): 
			movement.x -= 1
		if Input.is_action_pressed("Right"): 
			movement.x += 1
		
		if Input.is_action_just_pressed("Interact"):
			interact()
		
		movement.x = movement.x * delta * speed
	
	if movement.x != 0:
		if !walking:
			if movement.x > 0:
				$AnimatedSprite.flip_h = false
			elif movement.x < 0:
				$AnimatedSprite.flip_h = true
			$AnimatedSprite.animation = "Walking"
			walking = true
	else:
		$AnimatedSprite.animation = "Idle"
		walking = false
# warning-ignore:return_value_discarded
	move_and_collide(movement)
	

func interact():
	var overlap = interactionBox.get_overlapping_areas()
	var priority_area = null
	for area in overlap:
		if area.is_in_group("Stairs"):
			priority_area = area
		elif area.is_in_group("NPC"):
			priority_area = area
		elif area.name == "EndDay":
			get_parent().endDay()
	if priority_area != null:
		priority_area.interact(self)

