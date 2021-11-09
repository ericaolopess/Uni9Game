extends KinematicBody2D

const MOVE_SPEED = 20
var move_dir = 0

const JUMP_FORCE = 1100
const GRAVITY = 50
const MAX_FALL_SPEED = 500

var y_velo = 0

var isDead

func _ready():
	isDead = false
	

func _physics_process(delta):
	if !(isDead):	
		var grounded = is_on_floor();
		var no_chao = $RayD.is_colliding() or $RayE.is_colliding()
		
		if Input.is_action_pressed("sair"):
			get_tree().change_scene("res://scenes/Menu.tscn")
		
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
			
		if grounded and Input.is_action_just_pressed("jump"):
			y_velo = -JUMP_FORCE
			$sprite.animation = "jump"
			
		move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0,-1))
		
		y_velo += GRAVITY
		
		if grounded and y_velo >= 0 :
			y_velo = 5
			
		if y_velo > MAX_FALL_SPEED:
			y_velo = MAX_FALL_SPEED	
	

func dead():
	isDead = true
	$sprite.animation = "dead"
	

func _on_sprite_animation_finished():
	if (isDead):
		get_tree().change_scene("res://scenes/GameOver.tscn")
	
