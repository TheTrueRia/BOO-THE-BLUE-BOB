extends Label
var camPos;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camPos=get_node("../Camera2D").position
	position.x=camPos.x-550
	position.y=camPos.y-300
	text = "HP : " + str(get_node("../booCombat").health)

