extends CanvasLayer

signal Start

func _on_Start_pressed():
	emit_signal("Start")
