extends CharacterBody2D

var speed = 100
@onready var animated_sprite = $AnimatedSprite2D

func _process(_delta):
	velocity = Vector2()

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		animated_sprite.play("booRight")
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		animated_sprite.play("booLeft")
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		animated_sprite.play("booBack")
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		animated_sprite.play("booFront")
	else:
		animated_sprite.stop()

	velocity = velocity.normalized()*speed
	move_and_slide()
	

	
