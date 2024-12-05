extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Parrot.connect("finished_dialog", self, "_on_dialog_finished")
	Boombox.play_music(preload("res://music/victory.mp3"))
	Inventory.remove_item(preload("res://inventory/level_medium_key.tres"))
	Inventory.disable()
	get_node("Hotspot").disabled = true
	yield(get_tree().create_timer(0.2), "timeout")
	Parrot.skip_enabled = false
	Parrot.play(preload("res://dialogs/game_end.tres"))


# Define the signal handler
func _on_dialog_finished(sajt):
	get_node("Hotspot").disabled = false
	Parrot.skip_enabled = true
	(EgoVenture.state as GameState).medium_done = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hotspot_activate():
	EgoVenture.change_scene("res://scenes/level_selector.tscn")
