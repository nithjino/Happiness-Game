extends Area2D
export(String,FILE,"*.tscn") var room

func _on_Change_World_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(room)
