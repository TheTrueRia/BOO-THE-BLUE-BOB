extends Control

@export var scene_ville : SceneVille
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	scene_ville.connect("toggle_game_paused", _on_scene_ville_toggle_game_paused)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_scene_ville_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()


func _on_resume_button_pressed():
	scene_ville.game_paused = false


func _on_exit_button_pressed():
	get_tree().quit()
