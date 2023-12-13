extends Area2D

var label 
var image

func _ready():
	label =  $Label
	image = $Sprite2D
   


func _on_body_entered(body):
	if body.name == "BooJump":
		label.show()
		image.show()


func _on_body_exited(body):
	if body.name == "BooJump":
		label.hide()
		image.hide()
