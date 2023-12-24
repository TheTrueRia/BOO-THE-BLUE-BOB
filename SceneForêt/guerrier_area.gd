extends Area2D

var label
var image
var hasBeenPlayed = false
var in_area=false
var boo = CharacterBody2D
var dialog_has_been_display
var nbr_of_dialog1=1
var nbr_of_dialog2 = 1
var All_pos: Array[Vector2]
var feu_eteind = false
var collectible = preload("res://Collectibles.gd")

var tilemap
var target_layer = 6

const GuerrierLines: Array[String]=[
	"WARRIOR: Hey, you, Blob!",
	"WARRIOR: I need a hand here.",
	"WARRIOR: This wall of fire seems impassable.",
	"WARRIOR: Go ask the sorcerer a potion!"
]
const GuerrierLines2: Array[String]=[
	"WARRIOR: Thank you little blob.",
	"WARRIOR: Here a little gift for you",
	"WARRIOR: It is a precious gem I found in the lake."
]
var dialog1 : Array
var dialog2 : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $dialogue
	image = $Bulle
	boo = $"../BooJump"
	tilemap = $"../TileMap"
	dialog2.append(GuerrierLines2)
	dialog1.append(GuerrierLines)
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
			if(!dialog_has_been_display and !feu_eteind):
				dialog_has_been_display = true
				Dmanager.Multiple_Dialog(All_pos,dialog1,nbr_of_dialog1)
			elif !dialog_has_been_display and feu_eteind :
				dialog_has_been_display = true
				Dmanager.Multiple_Dialog(All_pos,dialog2,nbr_of_dialog2)
				hasBeenPlayed = true
				collectible.incrementGem()



func _on_body_entered(body):
	if body.name == "BooJump":
		label.show()
		image.show()
		in_area=true
		if collectible.potion > 0:
			if target_layer != -1:
				# Pour rendre le layer invisible
				tilemap.set_layer_enabled (6, false )
			feu_eteind=true
			collectible.decrementPotion()

func _on_body_exited(body):
	if body.name == "BooJump":
		label.hide()
		image.hide()
		in_area=false
		dialog_has_been_display= false
