extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -500
var motion = Vector2()
var count = 0
var coins = 0

func _ready():
	var os = OS.get_name() 
	print(os)
	if os == "X11" or os == "Windows" or os == "OSX":
		$GUI.hide()
	else:
		$GUI.show()

func _physics_process(delta):
	motion.y += GRAVITY
	if self.global_position.y > 705:
		self.global_position.y = 545
		self.global_position.x = 20	
	else:
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
			if Input.is_action_just_pressed("ui_select"):
				motion.y = JUMP_HEIGHT
				$jump.play()
			elif Input.is_action_pressed("ui_down"):
				motion.x = 0
				$CollisionShape2D.scale.y = 0.5
				$CollisionShape2D.position.y = 12
				$Sprite.play("duck")
				if Input.is_action_pressed("ui_right"):
					$Sprite.flip_h = false
					$Sprite.play("slide")
					if count == 0:
						motion.x = SPEED*25
						$Sprite.play("duck")
						count += 1
				if Input.is_action_pressed("ui_left"):
					$Sprite.flip_h = true
					$Sprite.play("slide")
					if count == 0:
						motion.x = -SPEED*25
						$Sprite.play("duck")
						count += 1
			else:
				$CollisionShape2D.scale.y = 1
				$CollisionShape2D.position.y = 0
				count = 0
		else:
			if motion.y < 0:
				$Sprite.play("jump_up")
			else:
				$Sprite.play("jump_down")
				
		motion = move_and_slide(motion,UP)

func camera_limits(cellsize,limits):	
	$Camera2D.limit_left = limits.position.x * cellsize.x
	$Camera2D.limit_right = limits.end.x * cellsize.x
	$Camera2D.limit_top = limits.position.y * cellsize.y
	$Camera2D.limit_bottom = limits.end.y * cellsize.y
