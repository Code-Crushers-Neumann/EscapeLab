extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Boombox.play_music(preload("res://music/victory.mp3"))
	Inventory.remove_item(preload("res://inventory/level_medium_key.tres"))
	Inventory.disable()
	yield(get_tree().create_timer(0.2), "timeout")
	Parrot.skip_enabled = false
	Parrot.play(preload("res://dialogs/game_end.tres"))
	yield(get_tree().create_timer(5), "timeout")
	Parrot.skip_enabled = true
	(EgoVenture.state as GameState).medium_done = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hotspot_activate():
	EgoVenture.change_scene("res://scenes/level_selector.tscn")
