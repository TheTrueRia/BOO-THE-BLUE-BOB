extends Area2D

var label
var image
var door
var hasBeenPlayed = false
var in_area=false
var boo = CharacterBody2D
var dialog_has_been_display
var nbr_of_dialog1=1
var nbr_of_dialog2 = 1
var All_pos: Array[Vector2]
var collectible = preload("res://Collectibles.gd")

const Mage_lines: Array[String]=[
	"SORCERER: By the mysteries of the occult",
	"SORCERER: and the portals of dimensions,",
	"SORCERER: my door remains sealed! O forces from beyond,",
	"SORCERER: To all who hear my plea, lend me your aid!"
]
const Mage_lines2: Array[String]=[
	"SORCERER: Thank you little blob.",
	"SORCERER: As a token of my gratitude, ",
	"SORCERER: allow me to offer you this potion. ",
	"SORCERER:It might come in handy on your journey." 
]
var dialog1 : Array
var dialog2 : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Label
	image = $Sprite2D
	boo = $"../BooJump"
	door = $"../DoorArea"
	dialog2.append(Mage_lines2)
	dialog1.append(Mage_lines)
	All_pos.append(global_position)
	All_pos.append(Vector2.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("text") and !hasBeenPlayed:
		if in_area:
			All_pos[1]=boo.global_position + Vector2(0,-75)
			label.hide()
			image.hide()
			if(!dialog_has_been_display and !door.is_open):
				dialog_has_been_display = true
				Dmanager.Multiple_Dialog(All_pos,dialog1,nbr_of_dialog1)
			elif !dialog_has_been_display and door.is_open :
				dialog_has_been_display = true
				Dmanager.Multiple_Dialog(All_pos,dialog2,nbr_of_dialog2)
				hasBeenPlayed = true
				collectible.incrementPotion()



func _on_body_entered(body):
	if body.name == "BooJump":
		label.show()
		image.show()
		in_area=true

func _on_body_exited(body):
	if body.name == "BooJump":
		label.hide()
		image.hide()
		in_area=false
		dialog_has_been_display= false
