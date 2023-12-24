extends CharacterBody2D
class_name Thief



@onready var animated_sprite = $AnimatedSprite2D
var master : CharacterBody2D

func _ready():
	master= $"../BooJump"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(master.voleur_taken):
		global_position = master.array_pos[10]
		if(master.velocity.x==0 && master.velocity.y == 0):
			animated_sprite.play("voleurCapeVole")
		elif(master.velocity.y < 0):
				animated_sprite.play("voleurDosRun")
		elif(master.velocity.x<=0 && master.velocity.y >= 0):
				animated_sprite.play("voleurRunLeft")
		else:
			animated_sprite.play("voleurRunRight")
	else:
		animated_sprite.play("voleurCapeVole")



func _on_door_area_body_entered(body):
	pass # Replace with function body.
