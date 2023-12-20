extends Node

@onready var text_box_scene = preload("res://Scenes/textbox.tscn")
var dialog_lines:Array[String]=[]
var current_line_index=0

var text_box
var text_box_position:Vector2

var lines : Array
var Pos : Array[Vector2]

var is_dialog_active = false
var can_advance_line =false

var nbr_of_dialog_left = 0

func Multiple_Dialog(Position: Array[Vector2],Lines: Array, nbr_of_dialog:int):
	nbr_of_dialog_left=nbr_of_dialog
	Pos=Position
	lines=Lines
	if nbr_of_dialog_left>0:
		start_dialog(Pos[nbr_of_dialog_left-1],lines[nbr_of_dialog_left-1])

func start_dialog(position:Vector2, Lines: Array[String]):
	if is_dialog_active:
		return
	dialog_lines=Lines
	text_box_position=position
	_show_text_box()
	is_dialog_active=true
	
func _show_text_box():
	text_box=text_box_scene.instantiate()
	text_box.finished_displaying.connect(_on_text_box_finished_displaying)
	get_tree().root.add_child(text_box)
	text_box.global_position=text_box_position
	text_box.display_text(dialog_lines[current_line_index])
	can_advance_line=false
	

func _on_text_box_finished_displaying():
	can_advance_line = true
	
func _unhandled_input(event):
	if (event.is_action_pressed("text")&& is_dialog_active && can_advance_line):
		text_box.queue_free()
		current_line_index+=1
		if current_line_index>=dialog_lines.size():
			is_dialog_active=false
			current_line_index=0
			nbr_of_dialog_left-=1
			if nbr_of_dialog_left>0:
				start_dialog(Pos[nbr_of_dialog_left-1],lines[nbr_of_dialog_left-1])
			return
		_show_text_box()

