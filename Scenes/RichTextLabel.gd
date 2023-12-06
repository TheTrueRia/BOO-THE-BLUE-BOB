extends RichTextLabel


func _ready():
	var image_file = "/tileset/bulle.png"
	var image = Image.new()
	var error = image.load(image_file)
	if error == OK:
		var texture = ImageTexture.new()
		texture.create_from_image(image)
		$RichTextLabel.add_image(texture)
	hide()  # Mask le label au début
	

func _on_sorcier_area_body_entered(body):
	if body.name == "BooJump":
		show()
