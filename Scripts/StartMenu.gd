extends Control

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Root.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
