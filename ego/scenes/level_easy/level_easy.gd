extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Boombox.play_music(preload("res://music/level_easy.mp3"))
	Inventory.enable()
	if((EgoVenture.state as GameState).easy_has_coded_message):
		get_node("Coded_Message").visible = false
#	if((EgoVenture.state as GameState).easy_has_number_code):
#		Inventory.add_item(preload("res://inventory/level_easy_number_note.tres"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if((EgoVenture.state as GameState).easy_flag && !get_node("FlagHotspot").visible):
		get_node("FlagHotspot").visible = true
		get_node("FlagHotspot").disabled = false
