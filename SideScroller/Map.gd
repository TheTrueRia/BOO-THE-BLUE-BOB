extends Node2D

var screen_size: Vector2i
var speed : float
const START_SPEED : float = 5.0
const MAX_SPEED : float = 25.0
var game_over = false


func new_game():
	screen_size=get_window().size
	$Camera2D.position = Vector2(576,324)
	$ground.position = Vector2i(0,0) 
	
	$GameOver.position.x = $Camera2D.position.x+300
	$GameOver.position.y = $Camera2D.position.y+400
	
	$GameFinished.position.x = $Camera2D.position.x+300
	$GameFinished.position.y = $Camera2D.position.y+400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = START_SPEED
	$booCombat.position.x+= speed
	$Camera2D.position.x+=speed
	
	if game_over:
		$GameOver.show()
		get_tree().paused = true
	
	#if $Camera2D.position.x - $ground.position.x > screen_size.x *1.5: 
		#$ground.position.x += screen_size.x

func _on_timer_timeout():
	game_over = true
