extends Node2D

var screen_size: Vector2i
var speed : float
const START_SPEED : float = 5.0
const MAX_SPEED : float = 25.0
var game_over = false
var obstacles : Array
var last_obs
var redBlob = preload("res://Scenes/redBlob.tscn")
var game_running = false

func new_game():
	randomize()
	get_tree().paused = false
	game_over = false
	game_running = false
	screen_size=get_window().size
	$booCombat.health = 10
	$booCombat.coins = 0
	$booCombat.position.x = 100
	$Camera2D.position = Vector2(576,324)
	#$ground.position = Vector2(0,0) 
	
	$GameOver.position.x = $Camera2D.position.x+300
	$GameOver.position.y = $Camera2D.position.y+400
	
	$GameFinished.position.x = $Camera2D.position.x+300
	$GameFinished.position.y = $Camera2D.position.y+400
	
	$GameOver2.hide()
# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOver2.get_node("Button").pressed.connect(new_game)
	new_game()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_running:
		speed = START_SPEED
		$booCombat.position.x+= speed
		$Camera2D.position.x+=speed
		generate_obs()
		if game_over:
			$GameOver.show()
			get_tree().paused = true
		#if $Camera2D.position.x - $ground.position.x > screen_size.x *1.5: 
			#$ground.position.x += screen_size.x
		for obs in obstacles:
			if obs.position.x < ($Camera2D.position.x - 800):
				remove_obs(obs)
	else:
		if Input.is_action_pressed("ui_accept"):
			game_running = true

func _on_timer_timeout():
	game_over = true

func generate_obs():
	if (obstacles.is_empty() or last_obs.position.x < $Camera2D.position.x - randi_range(300, 1000)):
		var obs
		var max_obs = 3
		for i in range(randi() % max_obs + 1):
			obs = redBlob.instantiate()
			#var obs_height = obs.get_node("AnimatedSprite2D").texture.get_height()
			#var obs_scale = obs.get_node("AnimatedSprite2D").scale
			var obs_x : int = $Camera2D.position.x+800
			var obs_y : int = $Camera2D.position.y+220
			last_obs = obs
			add_obs(obs, obs_x, obs_y)

func add_obs(obs, x, y):
	obs.position = Vector2i(x, y)
	obs.body_entered.connect(hit_obs)
	add_child(obs)
	obstacles.append(obs)
	
func remove_obs(obs):
	obs.queue_free()
	obstacles.erase(obs)
	
func hit_obs(body):
	if body.name == "booCombat":
		game_over = true
		$GameOver2.show()
