extends TextureButton
var collectible = preload("res://Collectibles.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if collectible.potion > 0 :
		show()
	else:
		hide()
