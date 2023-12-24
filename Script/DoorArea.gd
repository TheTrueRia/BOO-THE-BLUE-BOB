extends Area2D

class_name door

var label 
var image
var animation
var is_open
var boo : CharacterBody2D

func _ready():
	label =  $messagePorteFerme
	image = $Sprite2D
	animation = $door/AnimatedSprite2D
	is_open = false
	boo= $"../BooJump"
   
func _on_body_entered(body):
	if body.name == "BooJump" and is_open == false:
		label.show()
		image.show()
		if boo.voleur_taken == true:
			label.hide()
			image.hide()
			animation.play("opening")
			boo.voleur_taken = false
			is_open = true

func _on_body_exited(body):
	if body.name == "BooJump":
		label.hide()
		image.hide()
