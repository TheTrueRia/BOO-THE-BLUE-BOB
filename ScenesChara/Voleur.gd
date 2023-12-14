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
