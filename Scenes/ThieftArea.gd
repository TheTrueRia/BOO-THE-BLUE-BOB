extends Area2D

var label 


# Called when the node enters the scene tree for the first time.
func _ready():
	label = $dialogue


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "BooJump":
		label.show()

func _on_body_exited(body):
	if body.name == "BooJump":
		label.hide()
