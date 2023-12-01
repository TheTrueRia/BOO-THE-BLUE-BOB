extends CharacterBody2D

var speed = 0.5
@onready var animated_sprite = $AnimatedSprite2D

func _process(_delta):
	velocity = Vector2()

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		animated_sprite.play("booJumpRight")
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		animated_sprite.play("booJumpLeft")
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		animated_sprite.play("booJumpBack")
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
		animated_sprite.play("booJumpFace")
	else:
		animated_sprite.stop()

	velocity = velocity.normalized()
	position += velocity * speed
