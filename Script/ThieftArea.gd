extends Area2D

class_name Thieft_Area

var label
var image
var hasBeenPlayed = false
var in_area=false
var dialog_finish
var boo = CharacterBody2D
var dialog_has_been_display

var nbr_of_dialog=3
var All_pos: Array[Vector2]

const thieft_lines: Array[String]=[
	"THIEFT: Why should I help you? ",
	"THIEFT: Life is meaningless anyway. ",
	"THIEFT: Maybe this door will lead to my end, who knows?"
]
const Boo_lines: Array[String]=[
	"BOO: Hey, you there, the thief. ",
	"BOO: I need help opening this door. ",
	"BOO: Can you unlock it for me?"
]
const Boo_lines2: Array[String]=[
	"BOO: Do not speak like that.",
	"BOO: There is always hope, even in dark times. ",
	"BOO: Help me open this door, ",
	"BOO: and perhaps you'll find a new purpose in life."
]
var lines : Array


# Called when the node enters the scene tree for the first time.
func _ready():
	label = $dialogue
	image = $Sprite2D
	boo = $"../BooJump"
	lines.append(Boo_lines2)
	lines.append(thieft_lines)
	lines.append(Boo_lines)
	All_pos.append(global_position)
	All_pos.append(Vector2.ZERO)
	All_pos.append(global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("text") and !hasBeenPlayed:
		if in_area:
			All_pos[1]=boo.global_position + Vector2(0,-75)
			label.hide()
			image.hide()
			if(!dialog_has_been_display):
				dialog_has_been_display = true
				hasBeenPlayed = true
				Dmanager.Multiple_Dialog(All_pos,lines,nbr_of_dialog)




func _on_body_entered(body):
	if body.name == "BooJump" and !hasBeenPlayed:
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
