extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if((EgoVenture.state as GameState).easy_has_key):
		get_node("Hotspot").visible = false
		get_node("Hotspot").disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hotspot_activate():
	get_node("Hotspot").visible = false
	get_node("Hotspot").disabled = true
	(EgoVenture.state as GameState).easy_has_key = true
	Inventory.add_item(preload("res://inventory/level_easy_key.tres"))
	Parrot.play(preload("res://dialogs/level_easy_has_key.tres"))
