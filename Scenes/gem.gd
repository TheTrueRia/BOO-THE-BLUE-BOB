extends Area2D


func _on_body_entered(body):
	if body is BooJump:
		queue_free()
