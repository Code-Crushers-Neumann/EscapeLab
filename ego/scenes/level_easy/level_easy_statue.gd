extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if((EgoVenture.state as GameState).easy_has_number_code):
		get_node("Hotspot").disabled = true
		get_node("Hotspot").visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hotspot_activate():
	if((EgoVenture.state as GameState).easy_has_number_code != true):
		(EgoVenture.state as GameState).easy_has_number_code = true
		get_node("Hotspot").disabled = true
		get_node("Hotspot").visible = false
		Boombox.play_effect(preload("res://sounds/item_pickup.mp3"))
		if((EgoVenture.state as GameState).easy_has_coded_message):
			Parrot.play(preload("res://dialogs/level_easy_number_pickup_second.tres"))
			Inventory.add_item(preload("res://inventory/level_easy_number_note.tres"))
		else:
			Parrot.play(preload("res://dialogs/level_easy_number_pickup_first.tres"))
			Inventory.add_item(preload("res://inventory/level_easy_number_note.tres"))
