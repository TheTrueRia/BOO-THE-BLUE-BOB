extends Area2D
var collectible = preload("res://Collectibles.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name =="BooJump" and collectible.gem >= 3:
		get_tree().change_scene_to_file("res://SideScroller/Map.tscn")
