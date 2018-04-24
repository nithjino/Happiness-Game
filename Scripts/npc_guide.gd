extends KinematicBody2D

var dialog = ["Hey! This is the demo for the Happiness Project!","Enter the temple to start.","You can enter by pressing 'z'"]

func _process(delta):
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("idle")
