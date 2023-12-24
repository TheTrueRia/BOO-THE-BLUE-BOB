extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Called every time a key is pressed.
func _input(event):
	if event is InputEventKey:
		# Check if any key is pressed
		if event.pressed:
			# Change the scene to "Menu1.tscn"
			get_tree().change_scene_to_file("res://Menu/Menu1.tscn")
