extends AnimatedSprite

var opened = false
onready var label = get_parent().get_node("ChestLabel")

func _on_StaticBody2D_body_entered(body):
	if body.name == "Player":
		if body.coins == 14 and not opened:
			play("unlock")
			label.clear()
			label.add_text("You collected all the peaches! \n Thanks for playing the demo!")
			label.show()
			opened = true
		if body.coins < 14 and not opened:
			label.show()

func _on_Chest_animation_finished():
	play("open")


func _on_StaticBody2D_body_exited(body):
	if body.name == "Player":
		if not opened:
			label.hide()
