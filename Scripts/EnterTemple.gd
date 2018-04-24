extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			if Input.is_action_pressed("ui_z"):
				get_tree().change_scene("res://Scenes/Room2.tscn")