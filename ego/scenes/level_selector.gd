extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	EgoVenture.save_continue()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	EgoVenture.change_scene("res://scenes/level_tutorial/intro.tscn")
	(EgoVenture.state as GameState).tutorial_seen_door = false
	(EgoVenture.state as GameState).tutorial_has_note = false


func _on_Button2_pressed():
	EgoVenture.change_scene("res://scenes/level_easy/level_easy.tscn")


func _on_Button3_pressed():
	EgoVenture.change_scene("res://scenes/level_medium/level_medium.tscn")
