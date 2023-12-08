extends Area2D

var label
var image
var in_area=false
const lines: Array[String]=[
	"mettre  les  dialogue",
	"ici",
	"pour  les  display"
]


# Called when the node enters the scene tree for the first time.
func _ready():
	label = $dialogue
	image = $Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("text"):
		if in_area:
			label.hide()
			image.hide()
			Dmanager.start_dialog(global_position, lines)



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
