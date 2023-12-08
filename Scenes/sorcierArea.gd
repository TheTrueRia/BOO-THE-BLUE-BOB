extends Area2D

var label 
var image

func _ready():
	label =  $"../DialogueSorcier"
	image = $Sprite2D
   
func _on_Area2D_body_entered(body):
	if body.name == "BooJump":
		image.show()
		label.show()
		
		

func _on_Area2D_body_exited(body):
	if body.name == "BooJump":
		label.hide()
		image.hide()
