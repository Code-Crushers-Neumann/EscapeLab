extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tutorial_seen_door = false
var tutorial_has_note = false
var tutorial_unlocked_door = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.enable()
	get_node("Room").enable_navigation = false
	Parrot.play(preload("res://dialogs/tutorial_front_first.tres"))
	Parrot.skip_enabled = false
	yield(get_tree().create_timer(17), "timeout")
	get_node("Room").enable_navigation = true
	tutorial_seen_door = true
	Parrot.skip_enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Room_view_changed(old_view, new_view):
	if(new_view == "right" && tutorial_has_note == false):
		Parrot.skip_enabled = false
		get_node("Room").enable_navigation = false
		Parrot.play(preload("res://dialogs/tutorial_right_first.tres"))
		yield(get_tree().create_timer(9), "timeout")
		get_node("Room").enable_navigation = true
	elif(new_view == "front" && tutorial_seen_door == true && tutorial_has_note == false):
		pass
	elif(new_view == "front" && tutorial_seen_door == true && tutorial_has_note == true):
		Parrot.play(preload("res://dialogs/tutorial_front_has_note.tres"))
