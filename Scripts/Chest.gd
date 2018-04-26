extends AnimatedSprite
var opened = false

func _on_StaticBody2D_body_entered(body):
	if body.name == "Player":
		if body.coins == 14 and not opened:
			play("unlock")
			opened = true

func _on_Chest_animation_finished():
	play("open")
