extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if((EgoVenture.state as GameState).easy_has_coded_message):
		get_node("Message").visible = false
		get_node("Hotspot").visible = false
		get_node("Hotspot").disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hotspot_activate():
	(EgoVenture.state as GameState).easy_has_coded_message = true
	if((EgoVenture.state as GameState).easy_has_coded_message):
		get_node("Message").visible = false
		get_node("Hotspot").visible = false
		get_node("Hotspot").disabled = true
	if((EgoVenture.state as GameState).easy_has_number_code):
		Parrot.play(preload("res://dialogs/level_easy_message_pickup_second.tres"))
		Inventory.add_item(preload("res://inventory/level_easy_coded_message.tres"))
	else:
		Parrot.play(preload("res://dialogs/level_easy_message_pickup_first.tres"))
		Inventory.add_item(preload("res://inventory/level_easy_coded_message.tres"))
