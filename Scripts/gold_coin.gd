extends Node

onready var body = get_parent().get_parent().get_node("Player")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if is_visible():
			body.coins += 1
			get_parent().get_node("got_coin").play()
			hide()
