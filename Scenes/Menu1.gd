extends Node2D





func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/SceneVille.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_rules_pressed():
	pass # Replace with function body.


func _on_credit_pressed():
	pass # Replace with function body.
