extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -500
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_HEIGHT
		if Input.is_action_pressed("ui_down"):
			motion.x = 0
			$Sprite.play("duck")
	else:
		if motion.y < 0:
			$Sprite.play("jump_up")
		else:
			$Sprite.play("jump_down")
			
	motion = move_and_slide(motion,UP)
