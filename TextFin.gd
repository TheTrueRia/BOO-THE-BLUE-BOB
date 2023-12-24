extends Sprite2D

var label
var door
var hasBeenPlayed = false
var in_area=false
var cam = Camera2D
var dialog_has_been_display
var nbr_of_dialog=1
var All_pos: Array[Vector2]
var collectible = preload("res://Collectibles.gd")

const TextFin: Array[String]=[
	"Boo, my child! The seal has shattered!",
	"The world is on the brink of chaos!",
	"Now that you have obtained the 3 power gems, ",
	"we are now a singular entity.",
	"I bequeath my power to you;",
	"use it wisely and go stop the Red Blob.",
	"Go see the well"
]
var dialog : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Text
	dialog.append(TextFin)
	All_pos.append(Vector2.ZERO)
	cam = $"../BooJump/Camera2D"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if collectible.gem == 3 and !collectible.textFin:
		label.show()
		show()
		All_pos[0]= cam.global_position + Vector2(0,-75)
		if(!dialog_has_been_display):
			dialog_has_been_display = true
			Dmanager.Multiple_Dialog(All_pos,dialog,nbr_of_dialog)
			collectible.displayfin()

