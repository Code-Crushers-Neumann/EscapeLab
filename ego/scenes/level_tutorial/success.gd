extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.2), "timeout")
	Parrot.play(preload("res://dialogs/tutorial_success.tres"))
	yield(get_tree().create_timer(4), "timeout")
	Inventory.remove_item(preload("res://inventory/tutorial_note.tres"))
	Inventory.disable()
	EgoVenture.save_continue()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
