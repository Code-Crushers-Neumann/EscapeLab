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
	if ((EgoVenture.state as GameState).tutorial_seen_door != true):
		get_node("Room").enable_navigation = false
		Parrot.play(preload("res://dialogs/tutorial_front_first.tres"))
		Parrot.skip_enabled = false
		get_node("ajto").disabled = true
		yield(get_tree().create_timer(17), "timeout")
		get_node("Room").enable_navigation = true
		get_node("ajto").disabled = false
		Parrot.skip_enabled = true
		tutorial_seen_door = true
	else:
		tutorial_seen_door = true
	if((EgoVenture.state as GameState).tutorial_has_note):
		tutorial_has_note = true
	(EgoVenture.state as GameState).tutorial_seen_door = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Room_view_changed(old_view, new_view):
	if(new_view == "right" && tutorial_has_note == false):
		get_node("Note").disabled = true
		Parrot.skip_enabled = false
		get_node("Room").enable_navigation = false
		Parrot.play(preload("res://dialogs/tutorial_right_first.tres"))
		yield(get_tree().create_timer(9), "timeout")
		get_node("Note").disabled = false
		get_node("Room").enable_navigation = true
	elif(new_view == "front" && tutorial_seen_door == true && tutorial_has_note == false):
		Parrot.play(preload("res://dialogs/tutorial_front_no_note.tres"))
	elif(new_view == "front" && tutorial_seen_door == true && tutorial_has_note == true):
		Parrot.skip_enabled = false
		get_node("Room").enable_navigation = false
		Parrot.play(preload("res://dialogs/tutorial_front_has_note.tres"))
		yield(get_tree().create_timer(9), "timeout")
		get_node("Room").enable_navigation = true
		Parrot.skip_enabled = true


func _on_Hotspot_activate():
	Boombox.play_effect(preload("res://sounds/item_pickup.mp3"))
	Inventory.add_item(preload("res://inventory/tutorial_note.tres"))
	tutorial_has_note = true
	(EgoVenture.state as GameState).tutorial_has_note = true
	get_node("Note").visible = false
	get_node("Note").disabled = true


func _on_TriggerHotspot_item_used(item):
	if(item.title == "note" && tutorial_unlocked_door == false):
		tutorial_unlocked_door = true
		get_node("ajto").queue_free()
		Boombox.play_effect(preload("res://sounds/keypad.mp3"))
		yield(Boombox,"effect_finished")
		Boombox.play_effect(preload("res://sounds/keypad.mp3"))
		yield(Boombox,"effect_finished")
		Boombox.play_effect(preload("res://sounds/keypad.mp3"))
		yield(Boombox,"effect_finished")
		Boombox.play_effect(preload("res://sounds/keypad.mp3"))
		yield(Boombox,"effect_finished")
		Boombox.play_effect(preload("res://sounds/keypad_confirm.mp3"))
		get_node("opened").visible = true
		get_node("WalkHotspot").visible = true
		get_node("WalkHotspot").disabled = false
		Inventory.release_item()
		Parrot.play(preload("res://dialogs/tutorial_unequip.tres"))

func _on_TriggerHotspot_pressed():
	yield(get_tree().create_timer(0.2), "timeout")
	if(!tutorial_unlocked_door):
		Boombox.play_effect(preload("res://sounds/door_error.mp3"))
		Parrot.play(preload("res://dialogs/no_code.tres"))


func _on_WalkHotspot_activate():
	EgoVenture.change_scene("res://scenes/level_tutorial/success.tscn")
