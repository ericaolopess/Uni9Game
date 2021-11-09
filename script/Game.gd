extends Node2D

var life = 4

func _ready():
	$CanvasLayer/life.text = "Life: " + str(life)

func count_life():
	life -= 1
	$CanvasLayer/life.text = "Life: " + str(life)
	
	if (life == 0):
		$Player.dead()
	
