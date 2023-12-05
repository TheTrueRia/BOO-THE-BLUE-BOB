extends Label

func _ready():
	hide()  # Mask le label au début
	

func _on_sorcier_area_body_entered(body):
	if body.name == "BooJump":
		show()
