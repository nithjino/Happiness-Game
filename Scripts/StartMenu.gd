extends Control

var toggle = false

func _ready():
	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Root.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_Area2D_mouse_entered():
	$"New Game".play("open")
	toggle = false


func _on_New_Game_animation_finished():
	if toggle:
		$"New Game".play("closed")
	else:
		$"New Game".play("opened")


func _on_Area2D_mouse_exited():
	$"New Game".play("close")
	toggle = true


func _on_Area2D_input_event(viewport, event, shape_idx):
	if ((event is InputEventMouseButton and event.pressed) or (event is InputEventScreenTouch)):
		get_tree().change_scene("res://Scenes/Root.tscn")
