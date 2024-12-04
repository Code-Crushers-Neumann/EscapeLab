extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_TriggerHotspot_item_used(item):
	if(item.title == "Kulcs" && (EgoVenture.state as GameState).easy_done == false):
		(EgoVenture.state as GameState).easy_done = true
		Boombox.play_effect(preload("res://sounds/unlock_door.mp3"))
		yield(Boombox,"effect_finished")
		Boombox.play_effect(preload("res://sounds/door_open.mp3"))
		Inventory.release_item()
		EgoVenture.change_scene("res://scenes/level_easy/success.tscn")


func _on_TriggerHotspot_pressed():
	yield(get_tree().create_timer(0.2), "timeout")
	if(!(EgoVenture.state as GameState).easy_done):
		Boombox.play_effect(preload("res://sounds/door_locked.mp3"))
		Parrot.play(preload("res://dialogs/no_key.tres"))
