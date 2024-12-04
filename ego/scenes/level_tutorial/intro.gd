extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	EgoVenture.save_continue()
	Boombox.play_music(preload("res://music/tutorial_music.mp3"))
	Inventory.disable()
	yield(get_tree().create_timer(2), "timeout")
	Parrot.play(preload("res://dialogs/intro.tres"))
	Parrot.skip_enabled = false
	yield(get_tree().create_timer(17), "timeout")
	Parrot.skip_enabled = true
	EgoVenture.change_scene("res://scenes/level_tutorial/level_tutorial.tscn")
	EgoVenture.game_started = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
