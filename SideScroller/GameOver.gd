extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_node("../booCombat").game_over) == true:
		show()
		get_tree().paused = true
		
	if(get_node("../booCombat").health) == 0:
		show()
		get_tree().paused = true

	
