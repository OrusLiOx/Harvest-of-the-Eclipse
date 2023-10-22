extends Area2D

export (SpriteFrames) var spriteFrames
export var spriteOffset = 0
export var speed = 25
var interacting = false
var walking = false
var actiontime = 0.0
var action = "right"
var textField
var player

signal TalkedTo(person, day)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.frames = spriteFrames
	$AnimatedSprite.offset.y = float(spriteOffset)/2.0
	$AnimatedSprite.playing = true
	$AnimatedSprite.animation = "Idle"
	textField = $TextBox/ColorRect/Text

func _process(delta):
	var movement = Vector2.ZERO
	
	if !interacting:
		if actiontime < 0:
			actiontime = 3.0
			if action == "left":
				action = "right"
				$AnimatedSprite.flip_h = false
			elif action == "right":
				action = "idle"
			else:
				action = "left"
				$AnimatedSprite.flip_h = true
		if action == "left":
			movement.x -= 1
		if action == "right":
			movement.x += 1
		actiontime -= delta
		
		movement = movement * delta * speed
	else:
		if textField.percent_visible < 1.0:
			textField.percent_visible += 3 * delta
		elif Input.is_action_just_pressed("Interact"):
			interacting = false
			player.interacting = false
			$TextBox.hide()
	
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
		
	position += movement

func interact(var area):
	area.interacting = true
	interacting = true
	player = area
	
	emit_signal("TalkedTo", name, area.day)
