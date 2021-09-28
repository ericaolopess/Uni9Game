extends Area2D


func _on_Item_body_entered(body):
	
	#print(body.name)
	
	if (body.name == "Player"):
		queue_free()

