extends Area2D

class_name Thieft_Area



var label
var image
var in_area=false
var dialog_finish
var boo = CharacterBody2D
var dialog_has_been_display

var nbr_of_dialog=2
var All_pos: Array[Vector2]

const thieft_lines: Array[String]=[
	"Pourquoi devrais-je t'aider ?",
	"La vie n'a aucun sens de toute facon.",
	"Peut-etre que cette porte menera a ma fin, qui sait ?"
]
const Boo_lines: Array[String]=[
	"He, toi la-bas, le voleur.",
	"J'ai besoin d'aide pour ouvrir cette porte",
	"Peux-tu la deverrouiller pour moi ?"
]
var lines : Array


# Called when the node enters the scene tree for the first time.
func _ready():
	label = $dialogue
	image = $Sprite2D
	boo = $"../BooJump"
	lines.append(thieft_lines)
	lines.append(Boo_lines)
	All_pos.append(global_position)
	All_pos.append(Vector2.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("text"):
		if in_area:
			All_pos[1]=boo.global_position + Vector2(0,-75)
			label.hide()
			image.hide()
			if(!dialog_has_been_display):
				dialog_has_been_display = true
				Dmanager.Multiple_Dialog(All_pos,lines,nbr_of_dialog)



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
		if(dialog_has_been_display):
			dialog_finish=true
		dialog_has_been_display= false
