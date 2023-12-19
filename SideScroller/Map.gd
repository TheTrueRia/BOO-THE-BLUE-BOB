extends Node2D

var screen_size: Vector2i
var speed : float
const START_SPEED : float = 5.0
const MAX_SPEED : float = 25.0


func new_game():
	screen_size=get_window().size
	$Camera2D.position = Vector2(576,324)
	$ground.position = Vector2i(0,0) 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = START_SPEED
	$booCombat.position.x+= speed
	$Camera2D.position.x+=speed
	
	
	if $Camera2D.position.x - $ground.position.x > screen_size.x *1.5: 
		$ground.position.x += screen_size.x
