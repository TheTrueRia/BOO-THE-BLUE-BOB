extends RichTextLabel


func _ready():
	
	hide()  # Mask le label au début
	

func _on_sorcier_area_body_entered(body):
	if body.name == "BooJump":
		#var t=Texture.new()
		#t=load("res://tileset/bulle.png")
		#add_image(t, 400, 99)
		show()
		
