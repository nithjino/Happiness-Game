extends KinematicBody2D

func _process(delta):
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("idle")

