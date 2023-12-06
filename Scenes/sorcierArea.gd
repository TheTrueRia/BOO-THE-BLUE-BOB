extends Area2D

var label 

func _ready():
	label =  $"../DialogueSorcier"
   
func _on_Area2D_body_entered(body):
	if body.name == "BooJump":
		label.show()

func _on_Area2D_body_exited(body):
	if body.name == "BooJump":
		label.hide()
