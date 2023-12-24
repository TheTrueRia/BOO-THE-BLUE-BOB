extends Node2D

var story2 
var show2 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	story2 = $Story2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called every time a key is pressed.
func _input(event):
	if event is InputEventKey:
		# Check if any key is pressed
		if event.pressed:
			if(!show2):
				story2.show()
				show2 = true
			else:
				get_tree().change_scene_to_file("res://Scenes/SceneVille.tscn")
