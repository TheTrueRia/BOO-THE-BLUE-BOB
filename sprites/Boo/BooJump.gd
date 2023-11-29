extends CharacterBody2D


# get a reference to the sprite at the beginning (instead of using _ready())
@onready var animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		# run to right
		animated_sprite.play("booJumpRight")
	elif Input.is_action_pressed("ui_left"):
		# run to the left
		animated_sprite.play("booJumpLeft")
	elif Input.is_action_pressed("ui_up"):
		# run to the left
		animated_sprite.play("booJumpBack")
	elif Input.is_action_pressed("ui_down"):
		# run to the left
		animated_sprite.play("booJumpFace")
	else:
		animated_sprite.stop()
