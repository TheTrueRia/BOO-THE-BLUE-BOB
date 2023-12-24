extends Camera2D

var min_x : float = 300  # La coordonnée X minimale de la zone
var max_x : float = 1150-290  # La coordonnée X maximale de la zone
var min_y : float = 162  # La coordonnée Y minimale de la zone
var max_y : float = 650-162  # La coordonnée Y maximale de la zone

@onready var boo : BooJump = get_node("/root/SceneVille/BooJump")  # Assurez-vous de définir correctement le type de BooJump

# Appelé chaque trame du jeu
func _process(delta):
	# Vérifiez la position du Boo par rapport à la zone
	if boo.global_position.x < min_x or boo.global_position.x > max_x:
		global_position.x = lerp(global_position.x, boo.global_position.x, 0.1)
	if boo.global_position.y < min_y or boo.global_position.y > max_y:
		global_position.y = lerp(global_position.y, boo.global_position.y, 0.1)

	# Assurez-vous que la caméra ne dépasse pas les limites de la zone
	global_position.x = clamp(global_position.x, min_x, max_x)
	global_position.y = clamp(global_position.y, min_y, max_y)
