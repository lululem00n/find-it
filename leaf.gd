extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		GameManager.collect_leaf()
		queue_free()
