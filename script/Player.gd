extends KinematicBody2D

const MOVE_SPEED = 10
var move_dir = 0

func _physics_process(delta):
	
	if Input.is_action_pressed("right"):
		$sprite.animation = "walk"
		$sprite.flip_h = false
		move_dir += 1
	elif Input.is_action_pressed("left"):
		$sprite.animation = "walk"
		$sprite.flip_h = true
		move_dir -= 1	
	else:
		$sprite.animation = "idle"
		move_dir = 0
		
	move_and_slide(Vector2(move_dir * MOVE_SPEED, 0), Vector2(0,-1))
	
	













