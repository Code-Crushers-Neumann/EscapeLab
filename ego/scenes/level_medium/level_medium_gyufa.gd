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


func _on_Hotspot_activate():
	get_node("Hotspot").visible = false
	get_node("Hotspot").disabled = true
	Inventory.add_item(preload("res://inventory/level_medium_periodic.tres"))
	Parrot.play(preload("res://dialogs/level_medium_periodic_pickup.tres"))
